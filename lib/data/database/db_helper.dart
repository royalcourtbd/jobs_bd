import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:jobs_bd/data/dummy_data_model/notification_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'db_helper.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [NotificationModel])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Fetch all notifications
  Future<List<NotificationModelData>> getAllNotifications() =>
      select(notificationModel).get();

  // Insert a new notification
  Future<int> insertNotification(NotificationModelCompanion entry) =>
      into(notificationModel).insert(entry);

  // Delete all notifications
  Future<int> deleteAllNotifications() => delete(notificationModel).go();

  // Delete a single notification by id
  Future<int> deleteNotificationById(int id) {
    return (delete(notificationModel)..where((tbl) => tbl.id.equals(id))).go();
  }
}
