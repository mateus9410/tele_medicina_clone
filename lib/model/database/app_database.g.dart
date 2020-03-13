// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class TransitoryFile extends DataClass implements Insertable<TransitoryFile> {
  final String id;
  final String path;
  final String name;
  final DateTime date;
  final String description;
  final String directory;
  TransitoryFile(
      {@required this.id,
      @required this.path,
      @required this.name,
      @required this.date,
      @required this.description,
      @required this.directory});
  factory TransitoryFile.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return TransitoryFile(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      path: stringType.mapFromDatabaseResponse(data['${effectivePrefix}path']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      directory: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}directory']),
    );
  }
  factory TransitoryFile.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TransitoryFile(
      id: serializer.fromJson<String>(json['id']),
      path: serializer.fromJson<String>(json['path']),
      name: serializer.fromJson<String>(json['name']),
      date: serializer.fromJson<DateTime>(json['date']),
      description: serializer.fromJson<String>(json['description']),
      directory: serializer.fromJson<String>(json['directory']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'path': serializer.toJson<String>(path),
      'name': serializer.toJson<String>(name),
      'date': serializer.toJson<DateTime>(date),
      'description': serializer.toJson<String>(description),
      'directory': serializer.toJson<String>(directory),
    };
  }

  @override
  TransitoryFilesCompanion createCompanion(bool nullToAbsent) {
    return TransitoryFilesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      path: path == null && nullToAbsent ? const Value.absent() : Value(path),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      directory: directory == null && nullToAbsent
          ? const Value.absent()
          : Value(directory),
    );
  }

  TransitoryFile copyWith(
          {String id,
          String path,
          String name,
          DateTime date,
          String description,
          String directory}) =>
      TransitoryFile(
        id: id ?? this.id,
        path: path ?? this.path,
        name: name ?? this.name,
        date: date ?? this.date,
        description: description ?? this.description,
        directory: directory ?? this.directory,
      );
  @override
  String toString() {
    return (StringBuffer('TransitoryFile(')
          ..write('id: $id, ')
          ..write('path: $path, ')
          ..write('name: $name, ')
          ..write('date: $date, ')
          ..write('description: $description, ')
          ..write('directory: $directory')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          path.hashCode,
          $mrjc(
              name.hashCode,
              $mrjc(date.hashCode,
                  $mrjc(description.hashCode, directory.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is TransitoryFile &&
          other.id == this.id &&
          other.path == this.path &&
          other.name == this.name &&
          other.date == this.date &&
          other.description == this.description &&
          other.directory == this.directory);
}

class TransitoryFilesCompanion extends UpdateCompanion<TransitoryFile> {
  final Value<String> id;
  final Value<String> path;
  final Value<String> name;
  final Value<DateTime> date;
  final Value<String> description;
  final Value<String> directory;
  const TransitoryFilesCompanion({
    this.id = const Value.absent(),
    this.path = const Value.absent(),
    this.name = const Value.absent(),
    this.date = const Value.absent(),
    this.description = const Value.absent(),
    this.directory = const Value.absent(),
  });
  TransitoryFilesCompanion.insert({
    @required String id,
    @required String path,
    @required String name,
    @required DateTime date,
    @required String description,
    @required String directory,
  })  : id = Value(id),
        path = Value(path),
        name = Value(name),
        date = Value(date),
        description = Value(description),
        directory = Value(directory);
  TransitoryFilesCompanion copyWith(
      {Value<String> id,
      Value<String> path,
      Value<String> name,
      Value<DateTime> date,
      Value<String> description,
      Value<String> directory}) {
    return TransitoryFilesCompanion(
      id: id ?? this.id,
      path: path ?? this.path,
      name: name ?? this.name,
      date: date ?? this.date,
      description: description ?? this.description,
      directory: directory ?? this.directory,
    );
  }
}

class $TransitoryFilesTable extends TransitoryFiles
    with TableInfo<$TransitoryFilesTable, TransitoryFile> {
  final GeneratedDatabase _db;
  final String _alias;
  $TransitoryFilesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _pathMeta = const VerificationMeta('path');
  GeneratedTextColumn _path;
  @override
  GeneratedTextColumn get path => _path ??= _constructPath();
  GeneratedTextColumn _constructPath() {
    return GeneratedTextColumn(
      'path',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      false,
    );
  }

  final VerificationMeta _directoryMeta = const VerificationMeta('directory');
  GeneratedTextColumn _directory;
  @override
  GeneratedTextColumn get directory => _directory ??= _constructDirectory();
  GeneratedTextColumn _constructDirectory() {
    return GeneratedTextColumn(
      'directory',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, path, name, date, description, directory];
  @override
  $TransitoryFilesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'transitory_files';
  @override
  final String actualTableName = 'transitory_files';
  @override
  VerificationContext validateIntegrity(TransitoryFilesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (d.path.present) {
      context.handle(
          _pathMeta, path.isAcceptableValue(d.path.value, _pathMeta));
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (d.date.present) {
      context.handle(
          _dateMeta, date.isAcceptableValue(d.date.value, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (d.description.present) {
      context.handle(_descriptionMeta,
          description.isAcceptableValue(d.description.value, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (d.directory.present) {
      context.handle(_directoryMeta,
          directory.isAcceptableValue(d.directory.value, _directoryMeta));
    } else if (isInserting) {
      context.missing(_directoryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransitoryFile map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return TransitoryFile.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(TransitoryFilesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.path.present) {
      map['path'] = Variable<String, StringType>(d.path.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.date.present) {
      map['date'] = Variable<DateTime, DateTimeType>(d.date.value);
    }
    if (d.description.present) {
      map['description'] = Variable<String, StringType>(d.description.value);
    }
    if (d.directory.present) {
      map['directory'] = Variable<String, StringType>(d.directory.value);
    }
    return map;
  }

  @override
  $TransitoryFilesTable createAlias(String alias) {
    return $TransitoryFilesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $TransitoryFilesTable _transitoryFiles;
  $TransitoryFilesTable get transitoryFiles =>
      _transitoryFiles ??= $TransitoryFilesTable(this);
  TransitoryFilesDao _transitoryFilesDao;
  TransitoryFilesDao get transitoryFilesDao =>
      _transitoryFilesDao ??= TransitoryFilesDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [transitoryFiles];
}
