import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(
    MaterialApp(
    home: Home()
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _recuperarbancoDados()async{
    // banco/nomeapp
    final caminhoBd = await getDatabasesPath();
    final localBd =  join(caminhoBd,'banco.db');
    var bd;
    bd = await openDatabase(
      localBd,version: 1,onCreate: (db,version) {
        // integer, text
        String sql = "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, idade INTEGER)";
        db.execute(sql);
        
      },
    );
    print('aberto + ${bd.isOpen.toString()}');
   return bd;

  }
  _salvar()async{
    Database bd = await _recuperarbancoDados();
    Map<String,dynamic> dadosUsuario = {
      "nome": "Daniel",
      "idade": 28

    };
    
    int id = await bd.insert("usuarios", dadosUsuario);
    print("$id");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App banco de dados'),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: _recuperarbancoDados, child:Text('BD')),
          ElevatedButton(onPressed: _salvar, child: Text('Salvar')),

        ],
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _recuperarBancoDados() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "banco.db");

    var bd = await openDatabase(localBancoDados, version: 1,
        onCreate: (db, dbVersaoRecente) {
      String sql =
          "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER) ";
      db.execute(sql);
    });

    return bd;
    //print("aberto: " + bd.isOpen.toString() );
  }

  _salvar() async {
    Database bd = await _recuperarBancoDados();

    Map<String, dynamic> dadosUsuario = {"nome": "Maria Silva", "idade": 58};
    int id = await bd.insert("usuarios", dadosUsuario,conflictAlgorithm: ConflictAlgorithm.replace);
    print("Salvo: $id ");
  }

  @override
  Widget build(BuildContext context) {
    _salvar();

    return Container();
  }
}
*/