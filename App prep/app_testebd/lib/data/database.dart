import 'package:app_testebd/data/user_Dao.dart';
import "package:sqflite/sqflite.dart";

import 'package:path/path.dart';

Future<Database> getDatabase() async {
  //WidgetsFlutterBinding.ensureInitialized();
  final String path = join(await getDatabasesPath(), 'tablepessoa.db');
  return openDatabase(join(await getDatabasesPath()), onCreate: (db, version) {
    db.execute(UserDao.tablesql);
  }, version: 1);
}
