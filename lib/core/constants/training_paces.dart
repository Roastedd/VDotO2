/// Class providing training paces lookup based on Jack Daniels' VDOT tables
class TrainingPaces {
  /// Maps VDOT scores to training paces in seconds per kilometer
  static const Map<int, Map<String, double>> vdotPaces = {
    30: {
      'easy': 420.0, // 7:00 min/km
      'marathon': 396.0, // 6:36 min/km
      'threshold': 366.0, // 6:06 min/km
      'interval': 342.0, // 5:42 min/km
      'repetition': 324.0, // 5:24 min/km
    },
    31: {
      'easy': 414.0, // 6:54 min/km
      'marathon': 390.0, // 6:30 min/km
      'threshold': 360.0, // 6:00 min/km
      'interval': 336.0, // 5:36 min/km
      'repetition': 318.0, // 5:18 min/km
    },
    32: {
      'easy': 408.0, // 6:48 min/km
      'marathon': 384.0, // 6:24 min/km
      'threshold': 354.0, // 5:54 min/km
      'interval': 330.0, // 5:30 min/km
      'repetition': 312.0, // 5:12 min/km
    },
    33: {
      'easy': 402.0, // 6:42 min/km
      'marathon': 378.0, // 6:18 min/km
      'threshold': 348.0, // 5:48 min/km
      'interval': 324.0, // 5:24 min/km
      'repetition': 306.0, // 5:06 min/km
    },
    34: {
      'easy': 396.0, // 6:36 min/km
      'marathon': 372.0, // 6:12 min/km
      'threshold': 342.0, // 5:42 min/km
      'interval': 318.0, // 5:18 min/km
      'repetition': 300.0, // 5:00 min/km
    },
    35: {
      'easy': 390.0, // 6:30 min/km
      'marathon': 366.0, // 6:06 min/km
      'threshold': 336.0, // 5:36 min/km
      'interval': 312.0, // 5:12 min/km
      'repetition': 294.0, // 4:54 min/km
    },
    36: {
      'easy': 384.0, // 6:24 min/km
      'marathon': 360.0, // 6:00 min/km
      'threshold': 330.0, // 5:30 min/km
      'interval': 306.0, // 5:06 min/km
      'repetition': 288.0, // 4:48 min/km
    },
    37: {
      'easy': 378.0, // 6:18 min/km
      'marathon': 354.0, // 5:54 min/km
      'threshold': 324.0, // 5:24 min/km
      'interval': 300.0, // 5:00 min/km
      'repetition': 282.0, // 4:42 min/km
    },
    38: {
      'easy': 372.0, // 6:12 min/km
      'marathon': 348.0, // 5:48 min/km
      'threshold': 318.0, // 5:18 min/km
      'interval': 294.0, // 4:54 min/km
      'repetition': 276.0, // 4:36 min/km
    },
    39: {
      'easy': 366.0, // 6:06 min/km
      'marathon': 342.0, // 5:42 min/km
      'threshold': 312.0, // 5:12 min/km
      'interval': 288.0, // 4:48 min/km
      'repetition': 270.0, // 4:30 min/km
    },
    40: {
      'easy': 360.0, // 6:00 min/km
      'marathon': 336.0, // 5:36 min/km
      'threshold': 306.0, // 5:06 min/km
      'interval': 282.0, // 4:42 min/km
      'repetition': 264.0, // 4:24 min/km
    },
    41: {
      'easy': 354.0, // 5:54 min/km
      'marathon': 330.0, // 5:30 min/km
      'threshold': 300.0, // 5:00 min/km
      'interval': 276.0, // 4:36 min/km
      'repetition': 258.0, // 4:18 min/km
    },
    42: {
      'easy': 348.0, // 5:48 min/km
      'marathon': 324.0, // 5:24 min/km
      'threshold': 294.0, // 4:54 min/km
      'interval': 270.0, // 4:30 min/km
      'repetition': 252.0, // 4:12 min/km
    },
    43: {
      'easy': 342.0, // 5:42 min/km
      'marathon': 318.0, // 5:18 min/km
      'threshold': 288.0, // 4:48 min/km
      'interval': 264.0, // 4:24 min/km
      'repetition': 246.0, // 4:06 min/km
    },
    44: {
      'easy': 336.0, // 5:36 min/km
      'marathon': 312.0, // 5:12 min/km
      'threshold': 282.0, // 4:42 min/km
      'interval': 258.0, // 4:18 min/km
      'repetition': 240.0, // 4:00 min/km
    },
    45: {
      'easy': 330.0, // 5:30 min/km
      'marathon': 306.0, // 5:06 min/km
      'threshold': 276.0, // 4:36 min/km
      'interval': 252.0, // 4:12 min/km
      'repetition': 234.0, // 3:54 min/km
    },
    46: {
      'easy': 324.0, // 5:24 min/km
      'marathon': 300.0, // 5:00 min/km
      'threshold': 270.0, // 4:30 min/km
      'interval': 246.0, // 4:06 min/km
      'repetition': 228.0, // 3:48 min/km
    },
    47: {
      'easy': 318.0, // 5:18 min/km
      'marathon': 294.0, // 4:54 min/km
      'threshold': 264.0, // 4:24 min/km
      'interval': 240.0, // 4:00 min/km
      'repetition': 222.0, // 3:42 min/km
    },
    48: {
      'easy': 312.0, // 5:12 min/km
      'marathon': 288.0, // 4:48 min/km
      'threshold': 258.0, // 4:18 min/km
      'interval': 234.0, // 3:54 min/km
      'repetition': 216.0, // 3:36 min/km
    },
    49: {
      'easy': 306.0, // 5:06 min/km
      'marathon': 282.0, // 4:42 min/km
      'threshold': 252.0, // 4:12 min/km
      'interval': 228.0, // 3:48 min/km
      'repetition': 210.0, // 3:30 min/km
    },
    50: {
      'easy': 300.0, // 5:00 min/km
      'marathon': 276.0, // 4:36 min/km
      'threshold': 246.0, // 4:06 min/km
      'interval': 222.0, // 3:42 min/km
      'repetition': 204.0, // 3:24 min/km
    },
    51: {
      'easy': 294.0, // 4:54 min/km
      'marathon': 270.0, // 4:30 min/km
      'threshold': 240.0, // 4:00 min/km
      'interval': 216.0, // 3:36 min/km
      'repetition': 198.0, // 3:18 min/km
    },
    52: {
      'easy': 288.0, // 4:48 min/km
      'marathon': 264.0, // 4:24 min/km
      'threshold': 234.0, // 3:54 min/km
      'interval': 210.0, // 3:30 min/km
      'repetition': 192.0, // 3:12 min/km
    },
    53: {
      'easy': 282.0, // 4:42 min/km
      'marathon': 258.0, // 4:18 min/km
      'threshold': 228.0, // 3:48 min/km
      'interval': 204.0, // 3:24 min/km
      'repetition': 186.0, // 3:06 min/km
    },
    54: {
      'easy': 276.0, // 4:36 min/km
      'marathon': 252.0, // 4:12 min/km
      'threshold': 222.0, // 3:42 min/km
      'interval': 198.0, // 3:18 min/km
      'repetition': 180.0, // 3:00 min/km
    },
    55: {
      'easy': 270.0, // 4:30 min/km
      'marathon': 246.0, // 4:06 min/km
      'threshold': 216.0, // 3:36 min/km
      'interval': 192.0, // 3:12 min/km
      'repetition': 174.0, // 2:54 min/km
    },
    60: {
      'easy': 246.0, // 4:06 min/km
      'marathon': 222.0, // 3:42 min/km
      'threshold': 192.0, // 3:12 min/km
      'interval': 168.0, // 2:48 min/km
      'repetition': 150.0, // 2:30 min/km
    },
    65: {
      'easy': 222.0, // 3:42 min/km
      'marathon': 198.0, // 3:18 min/km
      'threshold': 168.0, // 2:48 min/km
      'interval': 144.0, // 2:24 min/km
      'repetition': 132.0, // 2:12 min/km
    },
    70: {
      'easy': 204.0, // 3:24 min/km
      'marathon': 180.0, // 3:00 min/km
      'threshold': 150.0, // 2:30 min/km
      'interval': 126.0, // 2:06 min/km
      'repetition': 114.0, // 1:54 min/km
    },
    75: {
      'easy': 186.0, // 3:06 min/km
      'marathon': 162.0, // 2:42 min/km
      'threshold': 138.0, // 2:18 min/km
      'interval': 114.0, // 1:54 min/km
      'repetition': 102.0, // 1:42 min/km
    },
    80: {
      'easy': 174.0, // 2:54 min/km
      'marathon': 150.0, // 2:30 min/km
      'threshold': 126.0, // 2:06 min/km
      'interval': 102.0, // 1:42 min/km
      'repetition': 90.0, // 1:30 min/km
    },
  };

  /// Gets training paces for a given VDOT value
  ///
  /// Returns a map with keys: 'easy', 'marathon', 'threshold', 'interval', 'repetition'
  /// Values are in seconds per kilometer
  static Map<String, double> getPaces(double vdot) {
    // Round down to the nearest integer VDOT
    final lowerVdot = vdot.floor();

    // Ensure we stay in range
    if (lowerVdot < 30) {
      return vdotPaces[30]!;
    }

    if (lowerVdot >= 80) {
      return vdotPaces[80]!;
    }

    // Get the pace tables for the lower and upper bounds
    final lowerPaces = vdotPaces[lowerVdot]!;

    // If we have an exact match or hit the maximum, return that
    if (lowerVdot == vdot.round() || lowerVdot >= 55 && lowerVdot < 60) {
      return lowerPaces;
    }

    // Find the upper VDOT
    int upperVdot;
    if (lowerVdot >= 55) {
      // For VDOT 55 and higher, we have 5-point jumps in the table
      upperVdot = ((lowerVdot / 5).ceil() * 5);
    } else {
      // For VDOT below 55, we have 1-point jumps
      upperVdot = lowerVdot + 1;
    }

    final upperPaces = vdotPaces[upperVdot]!;

    // Interpolate between the two pace sets
    final fraction = vdot - lowerVdot;
    final result = <String, double>{};

    for (final paceType in lowerPaces.keys) {
      final lowerPace = lowerPaces[paceType]!;
      final upperPace = upperPaces[paceType]!;

      // Linearly interpolate between lower and upper paces
      final interpolatedPace = lowerPace - (lowerPace - upperPace) * fraction;
      result[paceType] = interpolatedPace;
    }

    return result;
  }
}
