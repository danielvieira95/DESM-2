import 'package:app_bd3/database/data.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UsersDao {
  static const String _id = 'id';
  static const String _nome = 'nome';
  static const String _idade = 'idade';
  static const String _hobbie = 'hobbie';
  static const String _tablenome = 'userstable';

  // Define a consulta SQL para criar a tabela
  static const String tablesql = 'CREATE TABLE $_tablenome('
      '$_id TEXT PRIMARY KEY,'
      '$_nome TEXT,'
      '$_idade TEXT,'
      '$_hobbie TEXT)';

  Future<Database> get database async {
    return await getData();
  }

  Future<void> createTable(Database db) async {
    await db.execute(tablesql);
  }

  Future<int> salvar(Users user) async {
    final Database db = await database;
    var itemExist = await procuraruser(user.nome);
    if (itemExist.isEmpty) {
      return await db.insert(_tablenome, user.toMap());
    } else {
      return await db.update(
        _tablenome,
        user.toMap(),
        where: '$_nome = ?',
        whereArgs: [user.nome],
      );
    }
  }

  Future<List<Users>> procuraruser(String nomeusuario) async {
    final Database db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      _tablenome,
      where: '$_nome = ?',
      whereArgs: [nomeusuario],
    );
    return List.generate(result.length, (i) {
      return Users(
        result[i][_id],
        result[i][_nome],
        result[i][_idade],
        result[i][_hobbie],
      );
    });
  }

  Future<List<Users>> listaruser() async {
    final Database db = await database;
    final List<Map<String, dynamic>> result = await db.query(_tablenome);
    return List.generate(result.length, (i) {
      return Users(
        result[i][_id],
        result[i][_nome],
        result[i][_idade],
        result[i][_hobbie],
      );
    });
  }

  Future<int> deleteuser(String nomeusuario) async {
    final Database db = await database;
    return await db.delete(
      _tablenome,
      where: '$_nome = ?',
      whereArgs: [nomeusuario],
    );
  }
}

class Users {
  final String id;
  final String nome;
  final String idade;
  final String hobbie;

  Users(this.id, this.nome, this.idade, this.hobbie);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'idade': idade,
      'hobbie': hobbie,
    };
  }
}
