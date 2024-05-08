import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Para garantir que o Flutter esteja inicializado antes de acessar o banco de dados
  await _insertInitialDog(); // Espera a inserção do cachorro inicial antes de construir o widget
  runApp(MaterialApp(
    home: Home(),
  ));
}

Future<void> _insertInitialDog() async {
  var database = await _initializeDatabase();
  var Rocky = Dog(id: 5, nome: "Rocky", idade: 2);
  var Caju = Dog(id: 6, nome: "Caju", idade: 6);
  await _insertDog(database, Caju);
}

Future<Database> _initializeDatabase() async {
  return openDatabase(
    join(await getDatabasesPath(), 'dogs.db'),
    onCreate: (db, version) {
      db.execute(
        'CREATE TABLE dogs(id INTEGER PRIMARY KEY, nome TEXT, idade INTEGER)',
      );
    },
    version: 1,
  );
}

Future<void> _insertDog(Database database, Dog dog) async {
  await database.insert('dogs', dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Dog>> _dogs;

  @override
  void initState() {
    super.initState();
    _dogs = _fetchDogs();
  }

  Future<List<Dog>> _fetchDogs() async {
    var database = await _initializeDatabase();
    final List<Map<String, dynamic>> maps = await database.query('dogs');

    return List.generate(maps.length, (i) {
      return Dog(
        id: maps[i]['id'],
        nome: maps[i]['nome'],
        idade: maps[i]['idade'],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP BD"),
      ),
      body: FutureBuilder<List<Dog>>(
        future: _dogs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final dogs = snapshot.data!;
            return ListView.builder(
              itemCount: dogs.length,
              itemBuilder: (context, index) {
                final dog = dogs[index];
                return ListTile(
                  title: Text(dog.nome),
                  subtitle: Text('Idade: ${dog.idade}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class Dog {
  final int id;
  final String nome;
  final int idade;

  Dog({required this.id, required this.nome, required this.idade});

  Map<String, dynamic> toMap() {
    return {'id': id, 'nome': nome, 'idade': idade};
  }
}
