/// Utility class for pace calculations
class PaceCalculator {
  // Private constructor to prevent instantiation
  PaceCalculator._();

  /// Convert pace from seconds per kilometer to seconds per mile
  static double kmPaceToMilePace(double secondsPerKm) {
    return secondsPerKm * 1.60934;
  }

  /// Convert pace from seconds per mile to seconds per kilometer
  static double milePaceToKmPace(double secondsPerMile) {
    return secondsPerMile / 1.60934;
  }

  /// Convert pace (seconds per distance) to speed (distance per hour)
  static double paceToSpeed(double secondsPerDistance) {
    if (secondsPerDistance <= 0) return 0;
    return 3600 / secondsPerDistance;
  }

  /// Convert speed (distance per hour) to pace (seconds per distance)
  static double speedToPace(double distancePerHour) {
    if (distancePerHour <= 0) return 0;
    return 3600 / distancePerHour;
  }

  /// Calculate pace in seconds per kilometer from distance (meters) and time (seconds)
  static double calculatePace(double distanceMeters, double timeSeconds) {
    if (distanceMeters <= 0 || timeSeconds <= 0) return 0;
    return timeSeconds / (distanceMeters / 1000);
  }

  /// Calculate time in seconds from distance (meters) and pace (seconds per kilometer)
  static double calculateTime(double distanceMeters, double secondsPerKm) {
    if (distanceMeters <= 0 || secondsPerKm <= 0) return 0;
    return (distanceMeters / 1000) * secondsPerKm;
  }

  /// Calculate distance in meters from time (seconds) and pace (seconds per kilometer)
  static double calculateDistance(double timeSeconds, double secondsPerKm) {
    if (timeSeconds <= 0 || secondsPerKm <= 0) return 0;
    return (timeSeconds / secondsPerKm) * 1000;
  }

  /// Formats seconds into MM:SS format
  static String formatSecondsToMinSec(double seconds) {
    final int totalSeconds = seconds.round();
    final int minutes = totalSeconds ~/ 60;
    final int remainingSeconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  /// Formats seconds into HH:MM:SS format
  static String formatSecondsToHourMinSec(double seconds) {
    final int totalSeconds = seconds.round();
    final int hours = totalSeconds ~/ 3600;
    final int minutes = (totalSeconds % 3600) ~/ 60;
    final int remainingSeconds = totalSeconds % 60;

    if (hours > 0) {
      return '${hours.toString()}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
    } else {
      return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
    }
  }

  /// Parse time string (mm:ss or hh:mm:ss) to seconds
  static double parseTimeToSeconds(String timeString) {
    if (timeString.isEmpty) return 0;

    List<String> parts = timeString.split(':');
    if (parts.length == 2) {
      // mm:ss format
      int minutes = int.tryParse(parts[0]) ?? 0;
      int seconds = int.tryParse(parts[1]) ?? 0;
      return minutes * 60 + seconds.toDouble();
    } else if (parts.length == 3) {
      // hh:mm:ss format
      int hours = int.tryParse(parts[0]) ?? 0;
      int minutes = int.tryParse(parts[1]) ?? 0;
      int seconds = int.tryParse(parts[2]) ?? 0;
      return hours * 3600 + minutes * 60 + seconds.toDouble();
    }

    return 0;
  }

  /// Adjust pace for temperature
  ///
  /// Adjusts pace based on temperature above 15°C (59°F)
  /// Returns adjusted pace in seconds per kilometer
  static double adjustPaceForTemperature(
    double paceSecondsPerKm,
    double temperatureCelsius,
  ) {
    if (temperatureCelsius <= 15) return paceSecondsPerKm;

    // Approximately 0.3% slower per degree C above 15°C
    double adjustmentFactor = 1 + 0.003 * (temperatureCelsius - 15);
    return paceSecondsPerKm * adjustmentFactor;
  }

  /// Adjust pace for altitude
  ///
  /// Adjusts pace based on altitude above sea level
  /// Returns adjusted pace in seconds per kilometer
  static double adjustPaceForAltitude(
    double paceSecondsPerKm,
    double altitudeMeters,
  ) {
    if (altitudeMeters <= 0) return paceSecondsPerKm;

    // Approximately 0.4% slower per 100m of elevation
    double adjustmentFactor = 1 + 0.00004 * altitudeMeters;
    return paceSecondsPerKm * adjustmentFactor;
  }
}
