import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart'; // pacote utilizado para criar a tabela do banco de dados
import 'package:path/path.dart'; // pacote que pega o diretorio do banco de dados

void main() async {
  runApp(MaterialApp(
    home: Home(),
  ));

 // getDatabasePath pega o caminho do banco de dados
  final database = openDatabase(join(await getDatabasesPath(),'dogs.db'),
  onCreate: (db, version) {
    // Cria o banco de dados 
    db.execute('CREATE TABLE dogs(id INTEGER PRIMARY KEY, nome TEXT, idade INTEGER)');
  },version: 1);

  // salva informação
  Future<void> insertDog(Dog dog)async{
    final db = await database; // armazena em db o banco de dados
    // conflictAlgorithm caso de erro tenta sobrescrever
    db.insert('dogs', dog.toMap(),conflictAlgorithm: ConflictAlgorithm.replace); // salva a informação no banco de dados

  }
    // listar as informações salvas
    Future<List<Dog>> dogs() async {
    // Get a reference to the database.
    final db = await database;

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

   // Função para alterar dados já salvos no banco de dados
   Future<void> updateDog(Dog dog)async{
    final db = await database;
    await db.update('dogs',dog.toMap(), where: 'id = ?',whereArgs: [dog.id]);

   }

   // Funçao delete
   Future<void> deleteDog(int id)async{
    final db = await database; 
    await db.delete('dogs',where:  'id = ?',whereArgs: [id]);
    print("Deletando dado");

   }
  // insere dados
  var Rocky = Dog(
    id: 1,
    nome: 'Rocky',
    idade: 2,
  );
  var Marley = Dog(
    id: 3,
    nome: 'Marley',
    idade: 5,
  );
  var Jacare = Dog(
    id: 2,
    nome: 'Jacare',
    idade: 13,
  );
  insertDog(Marley);
  Rocky = Dog(
    id: Rocky.id,
    nome: Rocky.nome,
    idade: Rocky.idade + 7,
  );
  await updateDog(Rocky);
  
 // deletando um elemento
  deleteDog(1);
  print(await dogs());

}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP BD"),
      ),
      body: Column(
        children: [
          Text("App Banco de dados"),
        ],
      ),
    );
  }
}
// Classe Dog
class Dog{
  final int id;
  final String nome;
  final int idade;
  Dog({required this.id, required this.nome, required this.idade});
  // Função que converte os dados para formato Map
  Map<String,Object?> toMap(){
    return{
      'id':id,
      'nome':nome,
      'idade':idade
    };
  }

  @override
   String toString(){
    return 'Dog{id: $id, nome: $nome, idade: $idade}';
   }

}

class DogDao{
  
}