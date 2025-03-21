import 'dart:async';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vo2rpg/data/models/workout_execution.dart' as models;

part 'location_service.g.dart';

/// Service for handling location tracking during workouts
@riverpod
class LocationService extends _$LocationService {
  StreamSubscription<geo.Position>? _locationSubscription;
  final List<models.Position> _locationHistory = [];

  @override
  FutureOr<void> build() async {
    // Request location permissions on initialization
    await _checkLocationPermission();
    ref.onDispose(() {
      _locationSubscription?.cancel();
    });
  }

  /// Start tracking location
  Future<void> startTracking() async {
    if (_locationSubscription != null) return;

    final permission = await _checkLocationPermission();
    if (!permission) return;

    _locationSubscription = geo.Geolocator.getPositionStream(
      locationSettings: const geo.LocationSettings(
        accuracy: geo.LocationAccuracy.best,
        distanceFilter: 5, // Update every 5 meters
      ),
    ).listen((position) {
      final workoutPosition = models.Position(
        latitude: position.latitude,
        longitude: position.longitude,
        altitude: position.altitude,
        timestamp: position.timestamp,
      );
      _locationHistory.add(workoutPosition);
    });
  }

  /// Stop tracking location
  Future<void> stopTracking() async {
    await _locationSubscription?.cancel();
    _locationSubscription = null;
  }

  /// Get location history
  List<models.Position> getLocationHistory() {
    return List.unmodifiable(_locationHistory);
  }

  /// Clear location history
  void clearLocationHistory() {
    _locationHistory.clear();
  }

  /// Calculate total distance in meters
  double calculateTotalDistance() {
    if (_locationHistory.length < 2) return 0;

    double totalDistance = 0;
    for (int i = 0; i < _locationHistory.length - 1; i++) {
      totalDistance += geo.Geolocator.distanceBetween(
        _locationHistory[i].latitude,
        _locationHistory[i].longitude,
        _locationHistory[i + 1].latitude,
        _locationHistory[i + 1].longitude,
      );
    }

    return totalDistance;
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
}
