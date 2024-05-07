import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() async{
  runApp(MaterialApp(
    home: Home(),
  ));
 
}



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var Rock = Dog(id: 2, nome: 'Rocky', idade: 2);
  var Jacare = Dog(id: 3, nome: 'Jacare', idade: 13);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('App BD 7'),
      ),
      body: Column(
        children: [
          Text('App teste'),
          ElevatedButton(onPressed: (){
            DogDao().insertDog(Rock);
          }, child: Text('Salvar')),
          ElevatedButton(onPressed: (){
            print(DogDao().dogs());
            
          }, child: Text('Exibir')),
        ],
      ),
    );
  }
}
class DogDao{
  
  Future<Database>recuperabanco()async{
    WidgetsFlutterBinding.ensureInitialized();
    return openDatabase(
      join(await getDatabasesPath(),'dogdb.db'),
      onCreate: (db, version) {
        return db.execute('CREATE TABLE dogs(id INTEGER PRIMARY KEY, nome TEXT, idade INTEGER)'
        );
      },
      version: 1,
    );
      
  }

 Future<void>insertDog(Dog dog)async{
  final Database db = await recuperabanco();
  print(recuperabanco());
  await db.insert('dogs',dog.toMap());

}
/*
Future<List<Dog>> dogs()async{
  final db = await recuperabanco();
final List<Map<String,Object?>> dogMaps = await db.query('dogs');
return [
  for(final{
    'id': id as int,
    'name': nome as String,
    'idade': idade as int,
  } in dogMaps)Dog(id: id, nome: nome, idade:idade),
];

}
*/

Future<List<Dog>> dogs() async {
    final Database db = await recuperabanco();
    final List<Map<String, Object?>> dogMaps = await db.query('dogs');
    return [
      for (final dogMap in dogMaps) // Corrected the syntax here
        Dog(
          id: dogMap['id'] as int,
          nome: dogMap['nome'] as String,
          idade: dogMap['idade'] as int,
        ),
    ];
  }

Future<void> updateDog(Dog dog)async{
  final Database db = await recuperabanco();
  await db.update('dogs',dog.toMap(),where: 'id = ?', whereArgs: [dog.id]);
 

}
  Future<void> deleteDog(int id)async{
    final Database db = await recuperabanco();
    await db.delete('dogs',where: 'id = ?', whereArgs: [id]);

    

  }
  
}
class Dog{
  final int id;
  final String nome;
  final int idade;
  Dog({required this.id, required this.nome, required this.idade});

  Map<String,Object?> toMap(){
    return{
      'id': id,
      'nome':nome,
      'idade':idade
    };

 

  }

  String toString() {
    return 'Dog{id: $id, nome: $nome, idade $idade}';
}
}