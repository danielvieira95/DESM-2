
import 'package:app_bd3/database/user_Dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future <Database> getData()async{
  final String path= join(await getDatabasesPath(),'users.db');
  return openDatabase(path,onCreate: (db, version) {
    db.execute(UsersDao.tablesql);
  },version: 1);

}