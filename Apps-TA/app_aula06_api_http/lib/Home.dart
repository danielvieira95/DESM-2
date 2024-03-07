import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // pacote que irá permitir utilizar as funções
// para consumo da api
import 'dart:convert'; // Metodo que permite a conversao de dados
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
        title: Text("App consulta CEP"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: , child: Text("Consultar"))
        ],
      ),
    );
  }
}