import 'package:aula14prep/data/database.dart';
import 'package:sqflite/sqflite.dart';

class DogDao{
  static const String tableSql = 'CREATE TABLE $_tablename('
    '$_id INTEREGER,'
    '$_idade INTEREGER,' 
    '$_nome TEXT)';
  static const _tablename = "dogtable";
  static const _id = "id";
  static const _nome = "nome";
  static const _idade = "idade";

}





class Dog {
  final int id;
  final String name;
  final int age;

  Dog({
    required this.id,
    required this.name,
    required this.age,
  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}
