// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_helper.dart';

// ignore_for_file: type=lint
class $NotificationModelTable extends NotificationModel
    with TableInfo<$NotificationModelTable, NotificationModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _jobIdMeta = const VerificationMeta('jobId');
  @override
  late final GeneratedColumn<String> jobId = GeneratedColumn<String>(
      'job_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
      'body', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, jobId, title, body, imageUrl, timestamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notification_model';
  @override
  VerificationContext validateIntegrity(
      Insertable<NotificationModelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('job_id')) {
      context.handle(
          _jobIdMeta, jobId.isAcceptableOrUnknown(data['job_id']!, _jobIdMeta));
    } else if (isInserting) {
      context.missing(_jobIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NotificationModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotificationModelData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      jobId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}job_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      body: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url']),
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
    );
  }

  @override
  $NotificationModelTable createAlias(String alias) {
    return $NotificationModelTable(attachedDatabase, alias);
  }
}

class NotificationModelData extends DataClass
    implements Insertable<NotificationModelData> {
  final int id;
  final String jobId;
  final String title;
  final String body;
  final String? imageUrl;
  final DateTime timestamp;
  const NotificationModelData(
      {required this.id,
      required this.jobId,
      required this.title,
      required this.body,
      this.imageUrl,
      required this.timestamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['job_id'] = Variable<String>(jobId);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(body);
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  NotificationModelCompanion toCompanion(bool nullToAbsent) {
    return NotificationModelCompanion(
      id: Value(id),
      jobId: Value(jobId),
      title: Value(title),
      body: Value(body),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      timestamp: Value(timestamp),
    );
  }

  factory NotificationModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotificationModelData(
      id: serializer.fromJson<int>(json['id']),
      jobId: serializer.fromJson<String>(json['jobId']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String>(json['body']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'jobId': serializer.toJson<String>(jobId),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String>(body),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  NotificationModelData copyWith(
          {int? id,
          String? jobId,
          String? title,
          String? body,
          Value<String?> imageUrl = const Value.absent(),
          DateTime? timestamp}) =>
      NotificationModelData(
        id: id ?? this.id,
        jobId: jobId ?? this.jobId,
        title: title ?? this.title,
        body: body ?? this.body,
        imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
        timestamp: timestamp ?? this.timestamp,
      );
  NotificationModelData copyWithCompanion(NotificationModelCompanion data) {
    return NotificationModelData(
      id: data.id.present ? data.id.value : this.id,
      jobId: data.jobId.present ? data.jobId.value : this.jobId,
      title: data.title.present ? data.title.value : this.title,
      body: data.body.present ? data.body.value : this.body,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NotificationModelData(')
          ..write('id: $id, ')
          ..write('jobId: $jobId, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, jobId, title, body, imageUrl, timestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotificationModelData &&
          other.id == this.id &&
          other.jobId == this.jobId &&
          other.title == this.title &&
          other.body == this.body &&
          other.imageUrl == this.imageUrl &&
          other.timestamp == this.timestamp);
}

class NotificationModelCompanion
    extends UpdateCompanion<NotificationModelData> {
  final Value<int> id;
  final Value<String> jobId;
  final Value<String> title;
  final Value<String> body;
  final Value<String?> imageUrl;
  final Value<DateTime> timestamp;
  const NotificationModelCompanion({
    this.id = const Value.absent(),
    this.jobId = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  NotificationModelCompanion.insert({
    this.id = const Value.absent(),
    required String jobId,
    required String title,
    required String body,
    this.imageUrl = const Value.absent(),
    this.timestamp = const Value.absent(),
  })  : jobId = Value(jobId),
        title = Value(title),
        body = Value(body);
  static Insertable<NotificationModelData> custom({
    Expression<int>? id,
    Expression<String>? jobId,
    Expression<String>? title,
    Expression<String>? body,
    Expression<String>? imageUrl,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (jobId != null) 'job_id': jobId,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (imageUrl != null) 'image_url': imageUrl,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  NotificationModelCompanion copyWith(
      {Value<int>? id,
      Value<String>? jobId,
      Value<String>? title,
      Value<String>? body,
      Value<String?>? imageUrl,
      Value<DateTime>? timestamp}) {
    return NotificationModelCompanion(
      id: id ?? this.id,
      jobId: jobId ?? this.jobId,
      title: title ?? this.title,
      body: body ?? this.body,
      imageUrl: imageUrl ?? this.imageUrl,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (jobId.present) {
      map['job_id'] = Variable<String>(jobId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationModelCompanion(')
          ..write('id: $id, ')
          ..write('jobId: $jobId, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $NotificationModelTable notificationModel =
      $NotificationModelTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [notificationModel];
}

typedef $$NotificationModelTableCreateCompanionBuilder
    = NotificationModelCompanion Function({
  Value<int> id,
  required String jobId,
  required String title,
  required String body,
  Value<String?> imageUrl,
  Value<DateTime> timestamp,
});
typedef $$NotificationModelTableUpdateCompanionBuilder
    = NotificationModelCompanion Function({
  Value<int> id,
  Value<String> jobId,
  Value<String> title,
  Value<String> body,
  Value<String?> imageUrl,
  Value<DateTime> timestamp,
});

class $$NotificationModelTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NotificationModelTable,
    NotificationModelData,
    $$NotificationModelTableFilterComposer,
    $$NotificationModelTableOrderingComposer,
    $$NotificationModelTableCreateCompanionBuilder,
    $$NotificationModelTableUpdateCompanionBuilder> {
  $$NotificationModelTableTableManager(
      _$AppDatabase db, $NotificationModelTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$NotificationModelTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$NotificationModelTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> jobId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> body = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
          }) =>
              NotificationModelCompanion(
            id: id,
            jobId: jobId,
            title: title,
            body: body,
            imageUrl: imageUrl,
            timestamp: timestamp,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String jobId,
            required String title,
            required String body,
            Value<String?> imageUrl = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
          }) =>
              NotificationModelCompanion.insert(
            id: id,
            jobId: jobId,
            title: title,
            body: body,
            imageUrl: imageUrl,
            timestamp: timestamp,
          ),
        ));
}

class $$NotificationModelTableFilterComposer
    extends FilterComposer<_$AppDatabase, $NotificationModelTable> {
  $$NotificationModelTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get jobId => $state.composableBuilder(
      column: $state.table.jobId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get body => $state.composableBuilder(
      column: $state.table.body,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get imageUrl => $state.composableBuilder(
      column: $state.table.imageUrl,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$NotificationModelTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $NotificationModelTable> {
  $$NotificationModelTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get jobId => $state.composableBuilder(
      column: $state.table.jobId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get body => $state.composableBuilder(
      column: $state.table.body,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get imageUrl => $state.composableBuilder(
      column: $state.table.imageUrl,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$NotificationModelTableTableManager get notificationModel =>
      $$NotificationModelTableTableManager(_db, _db.notificationModel);
}
