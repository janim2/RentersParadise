import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rentersparadise/src/core/services/notification_service.dart';
import 'package:rentersparadise/src/views/screens/dashboard/Notifications.dart';

/// this class allows the to receive notifications from the app

class PushNotification {
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  static final NavigationService _navigationService = NavigationService();

  static Future init() async {
    /// request permission for IOS devices
    if (Platform.isIOS) {
      _firebaseMessaging.requestNotificationPermissions();
    }

    _firebaseMessaging.configure(

        /// called when the app is in the foreground
        onMessage: (Map<String, dynamic> message) async {
      print("onMessage: $message");
    },

        /// called when app is in the background
        onResume: (Map<String, dynamic> message) async {
      print("onResume: $message");
      _navigateToScreen(message);
    },

        /// called when the app is completely closed and it is launched
        /// from the pushed notification.
        onLaunch: (Map<String, dynamic> message) async {
      print("onLaunch: $message");
      _navigateToScreen(message);
    });
  }

  /// this function allows a user to navigate to a specific route based on
  /// the notification received.
  static void _navigateToScreen(Map<String, dynamic> message) {
    final notificationData = message['data'];
    final view = notificationData['view'];

    if (view != null) {
      if (view == 'property_status') {
        _navigationService.navigateTo(Notifications());
      }
    }
  }
}
