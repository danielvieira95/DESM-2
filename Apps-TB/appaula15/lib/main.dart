import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart'; // pacote que permite a manipulação de banco de dados
import 'package:path/path.dart'; // permite pegar o diretório de onde o bd é criado

void main() {
  runApp(MaterialApp(
    home:  Home(),
  ));
}
// função para inicializar o banco de dados
Future<Database> _initializeDatabase() async {
  return openDatabase(
    join(await getDatabasesPath(), 'dogs_a.db'),
    onCreate: (db, version) {
      db.execute(
        'CREATE TABLE dogsa(id INTEGER PRIMARY KEY, nome TEXT, idade INTEGER)',
      );
    },
    version: 1,
  );
}

Future<void> _insertDog(Database database, Dog dog) async {
  await database.insert('dogsa', dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
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
      appBar: AppBar(title: Text('App banco de dados'),),
      body: Column(
        children: [
          Text('Banco de dados'),
        ],
      ),
    );
  }
}
class Dog{
  final int id;
  String nome;
  final int idade;
  Dog({
    required this.id,
    required this.nome,
    required this.idade
  });
   // função para transformar os dados em Map para salvar no banco de dados
  Map<String,dynamic> toMap(){
    return { 'id':id, 'nome':nome, 'idade':idade};
  }

}