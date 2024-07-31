import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:jobs_bd/core/utility/utility.dart';
import 'package:jobs_bd/data/database/db_helper.dart';
import 'package:jobs_bd/data/dummy_data_model/job_model.dart';
import 'package:jobs_bd/data/repository/get_job_by_id_repository.dart';
import 'package:jobs_bd/presentation/home/presenter/home_presenter.dart';
import 'package:jobs_bd/test.dart';
import 'package:drift/drift.dart' as drift;

class NotificationService {
  final AppDatabase appDatabase = AppDatabase();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> saveNotification(RemoteMessage message) async {
    final notification = NotificationModelCompanion(
      jobId: drift.Value(message.data['jobId']),
      title: drift.Value(message.notification?.title ?? ''),
      body: drift.Value(message.notification?.body ?? ''),
      imageUrl: drift.Value(message.notification?.android?.imageUrl ?? ''),
      timestamp: drift.Value(DateTime.now()),
    );

    await appDatabase.insertNotification(notification);
  }

  void requestNotificationPermission() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      debugPrint('User granted provisional permission');
    } else {
      debugPrint('User declined or has not accepted permission');
    }
  }

  Future<void> showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'channel description',
      icon: '@drawable/notification_icon',
      color: Color(0xFF614730),
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    String? jobId = message.data['jobId'];

    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification!.title,
      message.notification!.body,
      platformChannelSpecifics,
      payload: jobId,
    );
  }

  void initNotificationClickListener() {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@drawable/notification_icon');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        String? jobId = response.payload;
        if (jobId != null) {
          handleNotificationClick(jobId);
        }
      },
      onDidReceiveBackgroundNotificationResponse:
          (NotificationResponse response) {
        String? jobId = response.payload;
        if (jobId != null) {
          handleNotificationClick(jobId);
        }
      },
    );
  }

  final HomePresenter homePresenter = Get.put(HomePresenter());

  void handleNotificationClick(String jobId) async {
    try {
      JobModel job = await GetJobByIdRepository().getJobById(jobId);

      Get.to(() => TestPage(job: job));
      homePresenter.incrementViews(job);
    } catch (e) {
      // Handle any errors, such as job not found
      showMessage(message: 'Job not found');
    }
  }
}
