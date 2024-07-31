import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:jobs_bd/data/service/notification_service.dart';

class FcmService {
  static void firebaseInit() async {
    // Handle notification when the app is in the foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      NotificationService notificationService = NotificationService();
      notificationService.showNotification(message);
      notificationService.saveNotification(message);

      if (message.notification != null) {
        debugPrint(
            'Message also contained a notification: ${message.notification}');
      }
    });

// Handle notification when the app is in the background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint("onMessageOpenedApp: $message");
      // Handle the message when the app is opened from a notification
      if (message.data.containsKey('jobId')) {
        String jobId = message.data['jobId'];
        NotificationService().handleNotificationClick(jobId);
        debugPrint('Job ID: ${message.data['jobId']}');
      }
    });
  }

  //
}
