import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // importa o pacote http para consumo da api
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
        title: Text("Conversor de moedas "),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}