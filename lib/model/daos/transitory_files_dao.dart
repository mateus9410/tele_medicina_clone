import 'package:moor_flutter/moor_flutter.dart';
import 'package:sigamed_tele_medicina/model/database/app_database.dart';
import 'package:sigamed_tele_medicina/model/tables/transitory_files.dart';

part 'transitory_files_dao.g.dart';

@UseDao(tables: [TransitoryFiles])
class TransitoryFilesDao extends DatabaseAccessor<AppDatabase>
    with _$TransitoryFilesDaoMixin {
  TransitoryFilesDao(AppDatabase db) : super(db);

  //C
  Future insertTransitoryFile(Insertable<TransitoryFile> file) =>
      into(db.transitoryFiles).insert(file);

  //R
  Future<TransitoryFile> getTransitoryFile(String fileId) =>
      (select(db.transitoryFiles)..where((t) => t.id.equals(fileId)))
          .getSingle();

  Future<List<TransitoryFile>> getAllTransitoryFilesFromDirectory(
          String directoryName) =>
      (select(db.transitoryFiles)
            ..where((t) => t.directory.equals(directoryName)))
          .get();

  Stream<List<TransitoryFile>> watchAllTransitoryFiles() =>
      select(db.transitoryFiles).watch();

  //U
  Future updateTransitoryFile(TransitoryFile file) =>
      (update(db.transitoryFiles)..where((t) => t.id.equals(file.id)))
          .replace(file);

  //D
  Future deleteTransitoryFile(String fileId) =>
      (delete(db.transitoryFiles)..where((t) => t.id.equals(fileId))).go();
}
