import 'package:app_aula14/data/databasedao.dart';
import 'package:sqflite/sqflite.dart'; // pacote que permite a interação com o banco de dados
import 'package:path/path.dart';  // pacote que permite encontrar o caminho para salvar o banco de dados

// Função que vai inicializar o banco de dados
Future<Database> getDatabase() async{
  // getDatabasePath irá pegar o diretório do banco de dados
  final String path = join(await getDatabasesPath(),'users.db');
  return openDatabase(path,onCreate: (db, version) {
    db.execute(UsersDao.tabela);
  });

}