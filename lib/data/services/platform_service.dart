import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Service for handling platform-specific functionality
class PlatformService {
  /// Initialize platform-specific plugins
  static Future<void> initialize() async {
    // Skip web-specific plugin initialization
    if (kIsWeb) {
      debugPrint('Skipping native plugin initialization on web platform');
      return;
    }

    try {
      // Initialize notifications
      await _initNotifications();

      // You can add other platform-specific initializations here
      // Such as geolocator, health, etc.
    } catch (e) {
      debugPrint('Error initializing platform plugins: $e');
      // Don't rethrow - we want to gracefully handle plugin failures
    }
  }

  /// Initialize local notifications
  static Future<void> _initNotifications() async {
    if (kIsWeb) return;

    try {
      final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();

      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');

      const DarwinInitializationSettings initializationSettingsIOS =
          DarwinInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
      );

      const InitializationSettings initializationSettings =
          InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
      );

      await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    } on PlatformException catch (e) {
      debugPrint('Failed to initialize notifications: $e');
    }
  }

  /// Check if the current platform is supported
  static bool isSupportedPlatform() {
    if (kIsWeb) {
      // Web is supported with limitations
      return true;
    }

    // Add platform-specific checks here if needed
    return true;
  }
}
