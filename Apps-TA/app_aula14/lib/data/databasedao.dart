import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class UsersDao{
  static const String _id = 'id';
  static const String  _nome = 'nome';
  static const String _idade = 'idade';
  static const _hobbie = 'hobbie';
  static const _tablenome = 'tablepessoas';
  static const String tabela = 'CREATE TABLE $_tablenome('
  '$_id INTEREGER,'
  '$_nome TEXT,'
  '$_idade INTEREGER,'
  '$_hobbie TEXT)';


}