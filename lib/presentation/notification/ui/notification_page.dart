import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_bd/data/database/db_helper.dart';
import 'package:jobs_bd/data/service/notification_service.dart';
import 'package:jobs_bd/presentation/home/presenter/home_presenter.dart';

class NotificationListScreen extends StatefulWidget {
  final AppDatabase db;

  NotificationListScreen(this.db, {super.key});

  @override
  _NotificationListScreenState createState() => _NotificationListScreenState();
}

class _NotificationListScreenState extends State<NotificationListScreen> {
  late NotificationService notificationService;
  final HomePresenter homePresenter =Get.put(HomePresenter());

  @override
  void initState() {
    super.initState();
    notificationService = NotificationService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: StreamBuilder<List<NotificationModelData>>(
        stream: widget.db.getAllNotifications().asStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          final notifications = snapshot.data ?? [];

          return ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final notification = notifications[index];

              return ListTile(
                onLongPress: () async {
                  await widget.db.deleteNotificationById(notification.id);
                  setState(() {}); // Trigger a rebuild after deletion
                },
                leading: notification.imageUrl != null
                    ? Image.network(notification.imageUrl!)
                    : const Icon(Icons.notification_important),
                title: Text(notification.title),
                subtitle: Text(notification.body),
                onTap: () {
                  notificationService
                      .handleNotificationClick(notification.jobId);
                      
                },
              );
            },
          );
        },
      ),
    );
  }
}
