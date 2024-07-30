import 'package:firebase_messaging/firebase_messaging.dart';

class FcmService {
  static void firebaseInit() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(message.notification!.body);
      print(message.notification!.title);

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }
}
