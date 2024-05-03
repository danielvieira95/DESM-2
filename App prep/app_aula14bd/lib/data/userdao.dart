import 'package:app_aula14bd/data/database.dart';
import 'package:sqflite/sqflite.dart';
class UserDao{
 static const String _id = 'id';
 static const String _nome = 'nome';
 static const String _idade = 'idade';
 static const String _hobbie = 'hobbie';
 static const _tablenome = 'tablepessoa';

 static const String tablesql = 'CREATE TABLE $_tablenome('
 '$_id INTEGER,'
 '$_nome TEXT,'
 '$_idade TEXT,'
 '$_hobbie TEXT)';
 salvar(Users user) async {
    final Database db = await getDatabase();
    print("Banco de dados encontrado em: $db");
    var itemExist = await procuraruser(user.nome);
    print("Usuario encontrado ${user.nome}");
    Map<String, dynamic> userMap = toMap(user);
    print("Mapa criado $userMap");
    if (itemExist.isEmpty) {
      print("O usuario nao existia ${user.nome}");
      return await db.insert(tablesql, userMap);
    } else {
      print("O usuario existia");
      return await db.update(tablesql, userMap, where: '$_nome =?', whereArgs: [user.nome]);
    }
  }

  // procura um usuario especifico
  procuraruser(String nomeusuario) async {
    print("Acessando banco de dados");
    final Database bd = await getDatabase(); // abre banco de dados
    final List<Map<String, dynamic>> result = await bd.query(tablesql,
        where: '$_nome = ?',
        whereArgs: [nomeusuario]); // pega todos os dados da tabela
    print("Resultado $result");
    return toList(result);
  }

  // lista todos os usuarios salvos
  Future<List<Users>> listaruser() async {
    print("Acessando banco de dados");
    final Database bd = await getDatabase(); // abre banco de dados
    final List<Map<String, dynamic>> result =
        await bd.query(tablesql); // pega todos os dados da tabela
    print("Resultado $result");
    return toList(result);
  }

  // apaga um usuario
  deleteuser(String nomeusuario) async {
    print("Deletando usuario $nomeusuario");
    final Database db = await getDatabase();
    return await db.delete(tablesql, where: "$_nome", whereArgs: [nomeusuario]);
  }

  Map<String, dynamic> toMap(Users user) {
    print("Convertendo usuarios em mapa de usuarios");
    final Map<String, dynamic> mapadeusuarios = Map();
    mapadeusuarios[_id] = user.id;
    mapadeusuarios[_nome] = user.nome;
    mapadeusuarios[_idade] = user.idade;
    mapadeusuarios[_hobbie] = user.hobbie;
    return mapadeusuarios;
  }

  List<Users> toList(List<Map<String, dynamic>> listadeusuarios) {
    final List<Users> usuarios = [];

    for (Map<String, dynamic> linha in listadeusuarios) {
      final Users usuario =
          Users(linha[_id], linha[_nome], linha[_idade], linha[_hobbie]);
      usuarios.add(usuario);
    }
    print("Lista de usuarios $usuarios");
    return usuarios;
  }
  
}

class Users {
  String id = 'id';
  String nome = 'nome';
  String idade = 'idade';
  String hobbie = 'hobbie';
  Users(this.id, this.nome, this.idade, this.hobbie);
}
