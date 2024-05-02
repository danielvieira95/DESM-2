
import 'package:aula14prep/data/DogDao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
Future<Database> getDatabase()async{
  final String path = join(await getDatabasesPath(),'dogtable');
  return openDatabase(join(await getDatabasesPath()),onCreate: (db,version){
  db.execute(DogDao.tableSql);
  },version: 1);


}