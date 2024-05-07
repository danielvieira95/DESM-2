import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DogDao{
  recuperaBD()async{
     String path = await getDatabasesPath();
     String caminho = await join(path,"dogs.db");
    return openDatabase(caminho, onCreate: (db, version) {
      return db.execute('CREATE TABLE cachorros(id INTEGER PRIMARY KEY, nome TEXT, idade INTEGER)');
    },
    version: 2,
    );

  }
  final int  id = 0;
  String nome = "teste";
  final int idade = 0;
Future<void> salvar(Dog dog)async{
  final  Database db = await recuperaBD();
  db.insert('dogs', dog.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);

 }
// A method that retrieves all the dogs from the dogs table.
  Future<List<Dog>> dogs() async {
    // Get a reference to the database.
    final Database db = await recuperaBD();

    // Query the table for all the dogs.
    final List<Map<String, Object?>> dogMaps = await db.query('dogs');

    // Convert the list of each dog's fields into a list of `Dog` objects.
    return [
      for (final {
            'id': id as int,
            'nome': nome as String,
            'idade': idade as int,
          } in dogMaps)
        Dog(id: id, nome: nome, idade: idade),
    ];
  }

  Future<void> updateDog(Dog dog) async {
    // Get a reference to the database.
    final Database db = await recuperaBD();

    // Update the given Dog.
    await db.update(
      'dogs',
      dog.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [dog.id],
    );
  }

  Future<void> deleteDog(int id) async {
    // Get a reference to the database.
    final Database db  = await recuperaBD();

    // Remove the Dog from the database.
    await db.delete(
      'dogs',
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

}

class Dog{
  final int id;
  final String nome;
  final int idade;
  Dog({required this.id,required this.nome, required this.idade});

  // Convert dog 
  Map<String,dynamic> toMap(){
    return {
      'id': id,
      'nome': nome,
      'idade': idade
    };
  }
}