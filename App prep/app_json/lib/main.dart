import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JSON Parsing Demo',
      home: JsonParsingDemo(),
    );
  }
}

class JsonParsingDemo extends StatefulWidget {
  @override
  _JsonParsingDemoState createState() => _JsonParsingDemoState();
}

class _JsonParsingDemoState extends State<JsonParsingDemo> {
  final String jsonData = '''
    {
      "produtos":[ 
        {
          "id": 1,
          "nome": "Telefone",
          "valor":  2500.00
        },
        {
          "id": 2,
          "nome": "Notebook",
          "valor":  6000.00
        },
        {
          "id": 3,
          "nome": "Televisao",
          "valor":  4600.00
        },
        {
          "id": 4,
          "nome": "Ar condicionado",
          "valor":  3200
        }
      ]
    }
  ''';

  late List<dynamic> produtos;

  @override
  void initState() {
    super.initState();
    parseJsonData();
  }

  void parseJsonData() {
    final parsed = jsonDecode(jsonData);
    produtos = parsed['produtos'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON Parsing Demo'),
      ),
      body: ListView.builder(
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(produtos[index]['nome']),
            subtitle: Text('Valor: \$${produtos[index]['valor']}'),
          );
        },
      ),
    );
  }
}
