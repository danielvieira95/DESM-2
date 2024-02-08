import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

// Classe Home do tipo Stateless
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
           // Material app necessário para construir os widgets
    return MaterialApp(
      home: Scaffold(
       appBar: AppBar(
        title:  Text("Aplicativo aula 02 - TA"),
       ), 
       body: Column(
        children: [
          Container(color: Colors.red,
          width: 200,
          height:200,),
        ],
       ),
      ) ,
    );
  }
}
