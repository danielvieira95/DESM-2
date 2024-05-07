import 'package:app_aula14bd/data/userdao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
Future<Database> getDatabase()async{
 
  final String path = join(await getDatabasesPath(),'tablepessoa');
  return openDatabase(join(await getDatabasesPath()),onCreate: (db, version) {
    db.execute(UserDao.tablesql);
  },version: 1);

  

}