import 'dart:math' as math;
import '../constants/training_paces.dart';

/// Represents a running pace in minutes:seconds per kilometer or mile
class Pace {
  final int minutes;
  final int seconds;
  final bool perMile;

  const Pace({
    required this.minutes,
    required this.seconds,
    this.perMile = false,
  });

  @override
  String toString() {
    return '$minutes:${seconds.toString().padLeft(2, '0')} min/${perMile ? 'mile' : 'km'}';
  }
}

/// Calculator for VDOT (VO2max) values and related training paces
class VdotCalculator {
  /// Calculates VDOT score based on race performance
  ///
  /// Uses Jack Daniels' formula for calculating VDOT from race performance
  ///
  /// [distance] is in meters
  /// [time] is the duration of the performance
  static double calculateVdot(
      {required double distance, required Duration time}) {
    // Convert time to minutes
    final timeMinutes = time.inSeconds / 60;

    // Calculate velocity in meters per minute
    final velocity = distance / timeMinutes;

    // Daniels formula coefficient
    final double percent = 0.8 +
        0.1894393 * math.exp(-0.012778 * timeMinutes) +
        0.2989558 * math.exp(-0.1932605 * timeMinutes);

    // Calculate VO2
    final vo2 = -4.60 + 0.182258 * velocity + 0.000104 * velocity * velocity;

    // Calculate VDOT
    final vdot = vo2 / percent;

    return vdot;
  }

  /// Gets training paces based on VDOT score
  ///
  /// Returns a map with keys for different training paces:
  /// - easy: easy/recovery runs
  /// - marathon: marathon pace
  /// - threshold: threshold/tempo runs
  /// - interval: interval training
  /// - repetition: repetition training
  ///
  /// Values are in seconds per kilometer
  static Map<String, double> getTrainingPaces(double vdot) {
    try {
      // Get paces from lookup table
      return TrainingPaces.getPaces(vdot);
    } catch (e) {
      // Fallback calculations in case lookup fails
      final Map<String, double> paces = {
        'easy': 0,
        'marathon': 0,
        'threshold': 0,
        'interval': 0,
        'repetition': 0,
      };

      // Apply minimum pace caps (maximum speed)
      return {
        'easy': math.max(paces['easy'] ?? 180.0, 180.0), // Minimum 3:00/km
        'marathon':
            math.max(paces['marathon'] ?? 156.0, 156.0), // Minimum 2:36/km
        'threshold':
            math.max(paces['threshold'] ?? 138.0, 138.0), // Minimum 2:18/km
        'interval':
            math.max(paces['interval'] ?? 120.0, 120.0), // Minimum 2:00/km
        'repetition':
            math.max(paces['repetition'] ?? 108.0, 108.0), // Minimum 1:48/km
      };
    }
  }

  /// Gets equivalent race times for standard distances based on VDOT
  ///
  /// Returns a map with race distances as keys and predicted times as values
  /// Distances: 1500m, 1mile, 3k, 5k, 10k, half_marathon, marathon
  static Map<String, Duration> getEquivalentRaceTimes(double vdot) {
    // Calculate paces in seconds per kilometer for different distances
    // These are derived from Jack Daniels' tables but simplified for our app
    final race1500mPace = _getEquivalentPace(vdot, 1.5);
    final race1MilePace = _getEquivalentPace(vdot, 1.609);
    final race3kPace = _getEquivalentPace(vdot, 3.0);
    final race5kPace = _getEquivalentPace(vdot, 5.0);
    final race10kPace = _getEquivalentPace(vdot, 10.0);
    final raceHalfMarathonPace = _getEquivalentPace(vdot, 21.0975);
    final raceMarathonPace = _getEquivalentPace(vdot, 42.195);

    // Calculate total times for each distance
    return {
      '1500m': Duration(seconds: (race1500mPace * 1.5).round()),
      '1mile': Duration(seconds: (race1MilePace * 1.609).round()),
      '3k': Duration(seconds: (race3kPace * 3.0).round()),
      '5k': Duration(seconds: (race5kPace * 5.0).round()),
      '10k': Duration(seconds: (race10kPace * 10.0).round()),
      'half_marathon':
          Duration(seconds: (raceHalfMarathonPace * 21.0975).round()),
      'marathon': Duration(seconds: (raceMarathonPace * 42.195).round()),
    };
  }

  /// Calculates equivalent pace in seconds per kilometer for a given distance
  static double _getEquivalentPace(double vdot, double distanceKm) {
    // Implementation based on Jack Daniels' formula
    // Higher VDOT means faster pace (lower seconds per km)

    // Constants for the pace calculation (based on curve fitting from Daniels' tables)
    const a = 0.00385;
    const b = -0.515;
    const c = 16.2;

    // Time multiplier based on race distance (longer races are run at slower relative pace)
    double distanceFactor;

    if (distanceKm <= 3.0) {
      // For distances up to 3k, the relationship is near-linear
      distanceFactor = 1.0 + 0.05 * distanceKm;
    } else if (distanceKm <= 10.0) {
      // For 5k to 10k, slightly more fatigue factor
      distanceFactor = 1.15 + 0.03 * distanceKm;
    } else if (distanceKm <= 21.0975) {
      // Half marathon has a higher fatigue component
      distanceFactor = 1.45 + 0.015 * distanceKm;
    } else {
      // Marathon has the highest fatigue factor
      distanceFactor = 1.72 + 0.0085 * distanceKm;
    }

    // Apply quadratic formula to solve for pace
    final v = vdot / distanceFactor;
    // Quadratic: a*x^2 + b*x + c - v = 0
    final discriminant = b * b - 4 * a * (c - v);

    // In case of negative discriminant (shouldn't happen with realistic values)
    if (discriminant < 0) {
      return 300.0; // Default to 5:00/km as fallback
    }

    // Velocity in meters per second (take positive solution of quadratic)
    final velocity = (-b + math.sqrt(discriminant)) / (2 * a);

    // Convert velocity (m/s) to pace (seconds per km)
    final pace = 1000 / velocity;

    return pace;
  }

  /// Gets a descriptive level for a given VDOT score
  static String getVdotLevel(double vdot) {
    if (vdot < 30) {
      return 'Beginner';
    } else if (vdot < 40) {
      return 'Novice';
    } else if (vdot < 50) {
      return 'Intermediate';
    } else if (vdot < 60) {
      return 'Advanced';
    } else {
      return 'Elite';
    }
  }

  /// Adjusts VDOT for environmental conditions
  ///
  /// [temperature] is in Celsius
  /// [altitude] is in meters
  static double adjustVdotForConditions(
      double vdot, double temperature, double altitude) {
    double adjustedVdot = vdot;

    // Adjust for temperature (performance decreases as temperature increases above 10°C)
    if (temperature > 10) {
      // For every 5°C above 10°C, reduce VDOT by approximately 1%
      final tempAdjustment = (temperature - 10) / 5 * 0.01;
      adjustedVdot = adjustedVdot * (1 - tempAdjustment);
    }

    // Adjust for altitude (performance decreases as altitude increases)
    if (altitude > 1000) {
      // For every 1000m above 1000m, reduce VDOT by approximately 5%
      final altAdjustment = (altitude - 1000) / 1000 * 0.05;
      adjustedVdot = adjustedVdot * (1 - altAdjustment);
    }

    return adjustedVdot;
  }
}
