import 'package:moor_flutter/moor_flutter.dart';
import 'package:sigamed_tele_medicina/main.dart';
import 'package:sigamed_tele_medicina/model/daos/transitory_files_dao.dart';
import 'package:sigamed_tele_medicina/model/database/app_database.dart';

class AppRepository {
  AppRepository() {
    AppDatabase db = database;
    _transitoryFilesDao = db.transitoryFilesDao;
  }

  //Daos
  TransitoryFilesDao _transitoryFilesDao;

  /* ************************************ *
               TRANSITORY FILES
   * ************************************ */
  Future insertTransitoryFile(Insertable<TransitoryFile> file) =>
      _transitoryFilesDao.insertTransitoryFile(file);
}
