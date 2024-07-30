import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:jobs_bd/data/service/notification_service.dart';

class FcmService {
  static void firebaseInit() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      NotificationService notificationService = NotificationService();
      notificationService.showNotification(message);

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }
}
