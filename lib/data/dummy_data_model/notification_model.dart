import 'package:drift/drift.dart';

class NotificationModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get jobId => text()();
  TextColumn get title => text()();
  TextColumn get body => text()();
  TextColumn get imageUrl => text().nullable()();
  DateTimeColumn get timestamp => dateTime().withDefault(currentDateAndTime)();
}
