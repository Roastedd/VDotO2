import 'dart:async';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:health/health.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
    as bg;
import 'package:logging/logging.dart';
import 'package:vo2rpg/data/models/workout.dart';
import 'package:vo2rpg/core/utils/pace_calculator.dart';

/// Service for tracking workout execution with GPS and health metrics
class WorkoutExecutionService {
  final _logger = Logger('WorkoutExecutionService');
  final _healthKit = HealthFactory();
  final _locationController = StreamController<geo.Position>.broadcast();
  final _metricsController = StreamController<WorkoutMetrics>.broadcast();
  Timer? _metricsTimer;
  bool _isTracking = false;
  DateTime? _startTime;
  final List<geo.Position> _locationHistory = [];
  double _totalDistance = 0;

  /// Stream of location updates during workout
  Stream<geo.Position> get locationStream => _locationController.stream;

  /// Stream of workout metrics (pace, distance, duration, heart rate)
  Stream<WorkoutMetrics> get metricsStream => _metricsController.stream;

  /// Start tracking a workout
  Future<void> startWorkout(Workout workout) async {
    if (_isTracking) return;
    _isTracking = true;
    _startTime = DateTime.now();
    _locationHistory.clear();
    _totalDistance = 0;

    // Check location permissions
    if (!await _checkLocationPermission()) {
      throw Exception('Location permission denied');
    }

    // Configure background location tracking
    await bg.BackgroundGeolocation.ready(bg.Config(
      desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
      distanceFilter: 10.0, // meters
      stopOnTerminate: false,
      startOnBoot: true,
      debug: false,
      logLevel: bg.Config.LOG_LEVEL_VERBOSE,
    ));

    // Start location tracking
    await bg.BackgroundGeolocation.start();
    bg.BackgroundGeolocation.onLocation((bg.Location location) {
      final position = geo.Position(
        latitude: location.coords.latitude,
        longitude: location.coords.longitude,
        timestamp: DateTime.now(),
        accuracy: location.coords.accuracy,
        altitude: location.coords.altitude,
        heading: location.coords.heading,
        speed: location.coords.speed,
        speedAccuracy: 0.0,
        altitudeAccuracy: 0.0,
        headingAccuracy: 0.0,
      );
      _locationController.add(position);
      _updateLocationMetrics(position);
    });

    // Start metrics tracking
    _startMetricsTracking();
  }

  /// Stop tracking the workout
  Future<void> stopWorkout() async {
    if (!_isTracking) return;
    _isTracking = false;
    _startTime = null;

    // Stop location tracking
    await bg.BackgroundGeolocation.stop();

    // Stop metrics tracking
    _metricsTimer?.cancel();
    _metricsTimer = null;
  }

  /// Update metrics based on new location
  void _updateLocationMetrics(geo.Position position) {
    _locationHistory.add(position);

    if (_locationHistory.length > 1) {
      final lastPosition = _locationHistory[_locationHistory.length - 2];
      final distance = geo.Geolocator.distanceBetween(
        lastPosition.latitude,
        lastPosition.longitude,
        position.latitude,
        position.longitude,
      );
      _totalDistance += distance;
    }
  }

  /// Calculate current pace from recent positions
  double _calculateCurrentPace() {
    if (_locationHistory.length < 2) return 0;

    // Use last 30 seconds of data for current pace
    final now = DateTime.now();
    final recentPositions = _locationHistory
        .where((p) =>
            p.timestamp.isAfter(now.subtract(const Duration(seconds: 30))))
        .toList();

    if (recentPositions.length < 2) return 0;

    final distance = geo.Geolocator.distanceBetween(
      recentPositions.first.latitude,
      recentPositions.first.longitude,
      recentPositions.last.latitude,
      recentPositions.last.longitude,
    );

    final duration = recentPositions.last.timestamp
        .difference(recentPositions.first.timestamp)
        .inSeconds;

    return PaceCalculator.calculatePace(distance, duration.toDouble());
  }

  /// Start tracking workout metrics (heart rate, etc.)
  void _startMetricsTracking() {
    _metricsTimer = Timer.periodic(const Duration(seconds: 1), (_) async {
      if (!_isTracking) return;

      try {
        // Get heart rate data
        final now = DateTime.now();
        final heartRateData = await _healthKit.getHealthDataFromTypes(
          DateTime.now().subtract(const Duration(minutes: 1)),
          DateTime.now(),
          [HealthDataType.HEART_RATE],
        );

        // Calculate current metrics
        double latestHeartRate = 0;
        if (heartRateData.isNotEmpty) {
          latestHeartRate = (heartRateData.last.value as num).toDouble();
        }

        final duration =
            _startTime != null ? now.difference(_startTime!) : null;
        final currentPace = _calculateCurrentPace();
        final averagePace = _totalDistance > 0 && duration != null
            ? PaceCalculator.calculatePace(
                _totalDistance, duration.inSeconds.toDouble())
            : null;

        _metricsController.add(
          WorkoutMetrics(
            heartRate: latestHeartRate.round(),
            currentPace: currentPace,
            averagePace: averagePace,
            distance: _totalDistance,
            duration: duration,
            speed: _locationHistory.isNotEmpty
                ? _locationHistory.last.speed
                : null,
            elevation: _locationHistory.isNotEmpty
                ? _locationHistory.last.altitude
                : null,
            timestamp: now,
          ),
        );
      } catch (e) {
        // Handle health data errors gracefully
        _logger.warning('Error getting health data: $e');
      }
    });
  }

  /// Dispose of resources
  void dispose() {
    _locationController.close();
    _metricsController.close();
    _metricsTimer?.cancel();
  }

  /// Check location permissions
  Future<bool> _checkLocationPermission() async {
    bool serviceEnabled = await geo.Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    geo.LocationPermission permission = await geo.Geolocator.checkPermission();
    if (permission == geo.LocationPermission.denied) {
      permission = await geo.Geolocator.requestPermission();
      if (permission == geo.LocationPermission.denied) {
        return false;
      }
    }

    if (permission == geo.LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }

  /// Calculate distance between two positions in meters
  double calculateDistance(geo.Position position1, geo.Position position2) {
    return geo.Geolocator.distanceBetween(
      position1.latitude,
      position1.longitude,
      position2.latitude,
      position2.longitude,
    );
  }

  double calculatePace(double distanceInMeters, Duration duration) {
    final minutes = duration.inSeconds / 60;
    final kilometers = distanceInMeters / 1000;
    return minutes / kilometers;
  }
}

/// Data class for workout metrics
class WorkoutMetrics {
  final int? heartRate;
  final double? currentPace;
  final double? averagePace;
  final double distance;
  final Duration? duration;
  final double? speed;
  final double? elevation;
  final DateTime timestamp;

  const WorkoutMetrics({
    this.heartRate,
    this.currentPace,
    this.averagePace,
    required this.distance,
    this.duration,
    this.speed,
    this.elevation,
    required this.timestamp,
  });
}
