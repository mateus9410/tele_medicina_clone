import 'package:moor_flutter/moor_flutter.dart';
import 'package:sigamed_tele_medicina/model/daos/transitory_files_dao.dart';
import 'package:sigamed_tele_medicina/model/tables/transitory_files.dart';

part 'app_database.g.dart';

@UseMoor(tables: [TransitoryFiles], daos: [TransitoryFilesDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'database.sqlite',
          logStatements: true,
        )));

  @override
  int get schemaVersion => 1;
}
