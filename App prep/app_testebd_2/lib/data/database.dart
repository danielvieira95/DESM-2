import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getData()async{
  final String path = join(await getDatabasesPath(),'dog_database.db');
  return openDatabase(path,onCreate: (db, version) {
    db.execute('CREATE TABLE dogs(id INTEGER, name TEXT, age INTEGER)');
    
  },version: 1);
}