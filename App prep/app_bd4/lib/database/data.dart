import 'package:app_bd4/database/userdao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase()async{
  
  return openDatabase(join(await getDatabasesPath(),'users.db'),
  
  onCreate: (db, version) {
    print(getDatabasesPath());
    return db.execute(UsersDao.tableSql);
  },
  
  version: 1,
  );

}