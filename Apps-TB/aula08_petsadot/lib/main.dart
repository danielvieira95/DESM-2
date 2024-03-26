import 'package:flutter/material.dart';

void main() {
  runApp(Home());
  
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App Pets", // o campo title do Material app é do tipo String
      // Então nao precisa do Text como no Scaffold
      home: PetsScreen(), // classe que constroi a tela do aplicativo
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
    );
  }
}

class PetsScreen extends StatefulWidget {
  const PetsScreen({super.key});

  @override
  State<PetsScreen> createState() => _PetsScreenState();
}

class _PetsScreenState extends State<PetsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Pet"),
      ),
      body: Column(

      ),
    );
  }
}