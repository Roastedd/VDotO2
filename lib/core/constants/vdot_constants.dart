/// Constants for VDOT calculations based on Jack Daniels' methodology
class VdotConstants {
  // Private constructor to prevent instantiation
  VdotConstants._();

  /// VDOT levels with their corresponding scores
  static const Map<String, Map<String, dynamic>> vdotLevels = {
    'beginner': {'name': 'Beginner - White', 'female': 34.3, 'male': 36.8},
    'novice': {'name': 'Novice - Yellow', 'female': 39.0, 'male': 42.0},
    'intermediate': {
      'name': 'Intermediate - Green',
      'female': 43.0,
      'male': 46.0,
    },
    'advanced': {'name': 'Advanced - Blue', 'female': 48.0, 'male': 52.0},
    'elite': {'name': 'Elite - Purple', 'female': 53.0, 'male': 58.0},
    'national': {'name': 'National - Red', 'female': 58.0, 'male': 64.0},
    'world': {'name': 'World Class - Bronze', 'female': 63.0, 'male': 70.0},
    'olympic': {'name': 'Olympic - Silver', 'female': 67.0, 'male': 75.0},
    'professional': {
      'name': 'Professional - Gold',
      'female': 71.0,
      'male': 80.0,
    },
  };

  /// Standard race distances in meters
  static const Map<String, double> raceDistances = {
    'marathon': 42195.0,
    'halfMarathon': 21097.5,
    '15k': 15000.0,
    '10k': 10000.0,
    '5k': 5000.0,
    '3k': 3000.0,
    '1mile': 1609.34,
    '1500m': 1500.0,
    '800m': 800.0,
    '400m': 400.0,
  };

  /// Percentage of VO2max for different training intensities
  static const Map<String, Map<String, double>> trainingIntensities = {
    'easy': {
      'min': 59.0, // % of VO2max
      'max': 74.0,
      'hrMin': 65.0, // % of HRmax
      'hrMax': 79.0,
    },
    'marathon': {'min': 75.0, 'max': 84.0, 'hrMin': 80.0, 'hrMax': 90.0},
    'threshold': {'min': 83.0, 'max': 88.0, 'hrMin': 88.0, 'hrMax': 92.0},
    'interval': {'min': 97.0, 'max': 100.0, 'hrMin': 98.0, 'hrMax': 100.0},
    'repetition': {'min': 105.0, 'max': 120.0, 'hrMin': 100.0, 'hrMax': 100.0},
  };

  /// Coefficients for VDOT calculation
  /// Based on the formula: VDOT = -4.6 + 0.182258 * (dist/time) + 0.000104 * (dist/time)^2
  /// where dist is in meters and time is in seconds
  static const double vdotCoeffA = -4.6;
  static const double vdotCoeffB = 0.182258;
  static const double vdotCoeffC = 0.000104;

  /// Temperature adjustment factors (percentage per degree Celsius above 15°C)
  static const double tempAdjustmentFactor =
      0.003; // 0.3% per degree C above 15°C

  /// Altitude adjustment factors (percentage per meter above sea level)
  static const double altitudeAdjustmentFactor = 0.00004; // 0.004% per meter
}
