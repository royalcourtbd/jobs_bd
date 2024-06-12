import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:jobs_bd/presentation/job/ui/job_list_page.dart';

class FirebaseMessagingRepository {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  //Function to initialize Notification
  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();

    final fcmTocken = await _firebaseMessaging.getToken();
    print('FCM Token: $fcmTocken');
  }

  //Function to get Notification Data
  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    print('Message data: ${message.data}');
    print('Message notification: ${message.notification}');

    Get.to(() => JobListPage());
  }

  Future initPushNotification() async {
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    FirebaseMessaging.onMessage.listen(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
