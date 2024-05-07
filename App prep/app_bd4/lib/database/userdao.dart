import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:app_bd4/database/data.dart';
class UsersDao{
  static const String tableSql = 'CREATE TABLE $_tablename(''id INTEGER PRIMARY KEY,'
    '$_name TEXT,'
     '$_idade TEXT)';


    static const String _tablename = 'userstable';
    static const String _name = 'name';
    static const String _idade = '2';

    // função para salvar um usuario
    salvar(Users usuario)async{
      print('iniciando o salvamento ');
      print(getDatabasesPath());
      final Database bd = await getDatabase();
      var itemExists = await find(usuario.name);
      Map<String,dynamic>usuarioMap = toMap(usuario);
      if(itemExists.isEmpty){
        print('O usuario nao existia');
        return await bd.insert(_tablename,usuarioMap,conflictAlgorithm: ConflictAlgorithm.replace);
      }
      else{
        print('O usuario existia');
        return await bd.update(_tablename, usuarioMap,where: '$_name',whereArgs: [usuario.name]);
      }
     
    }
    Map<String,dynamic> toMap(Users usuario){
      print('Convertendo para Map');
      final Map<String,dynamic> usuarioMap= Map();
      usuarioMap[_name] = usuario.name.toString();
      usuarioMap[_idade] = usuario.idade.toString();
      print('$usuarioMap');
      return  usuarioMap;
    }
    Future <List<Users>> findAll()async{
      print('Acessando o find all');
      final Database bd = await getDatabase();
      final List <Map<String,dynamic>> result = await bd.query(_tablename);
      print('Procurando dados no banco $result');
      return toList(result);

    }
    List<Users> toList(List<Map<String,dynamic>> mapadeusuarios){
      print('Convertendo to list');
      final List<Users> usuarios =[];
      for(Map<String,dynamic> linha in mapadeusuarios){
        final Users usuario = Users(linha[_name],linha[_idade]);
        usuarios.add(usuario);
      }
      print('Lista de usuarios ${usuarios.toString()}');
      return usuarios;
    }
    Future<List<Users>> find(String nomeusuario)async{
      print('Acessando o find');
      final Database bd  = await getDatabase();
      print('Procurando o usuario ${nomeusuario}');
      final List<Map<String,dynamic>> result = await bd.query(_tablename,where: '$_name = ?',whereArgs: [nomeusuario]);
      print('Usuario encontrado: ${toList(result)}');
      return toList(result);


    }
    delete(String nomeusuario)async{
      print('Deletando usuario ${nomeusuario}');
      final Database bd = await getDatabase();
      return await bd.delete(_tablename,where: '$_name = ? ',whereArgs: [nomeusuario]);

    }
}

class Users{
  String name;
  String idade;
  Users(this.name, this.idade);
}