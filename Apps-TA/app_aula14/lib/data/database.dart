import 'package:app_aula14/data/databasedao.dart';
import 'package:sqflite/sqflite.dart'; // pacote que permite a interação com o banco de dados
import 'package:path/path.dart';  // pacote que permite encontrar o caminho para salvar o banco de dados
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
// Função que vai inicializar o banco de dados
Future<Database> getDatabase() async{
  sqfliteFfiInit();

  var databaseFactory = databaseFactoryFfi;
  var db = await databaseFactory.openDatabase(inMemoryDatabasePath);
  // getDatabasePath irá pegar o diretório do banco de dados
  final String path = join(await getDatabasesPath(),'tablepessoas.db');
  return  openDatabase(path,onCreate: (db, version) {
    db.execute(UsersDao.tabela);
  },version: 1);

}