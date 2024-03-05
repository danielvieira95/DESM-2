import 'package:flutter/material.dart';
import 'dart:math'; // importa o pacote para fazer operações matemáticas, conversoes de valores
void main() {
  runApp(const MyApp());
}
// Cria a classe do aplicativo animated container APP
class AnimatedContainerApp extends StatefulWidget {
   
  double height =50; // variaveis para controlar o container
  double width =50; // variavel para controlar a largura do container
  Color color = Colors.blueGrey; // variavel para armazenar a cor do container
  BorderRadiusGeometry borderRadius = BorderRadius.circular(8); // Variavel para armazenar
  // a borda do container
  @override
  State<AnimatedContainerApp> createState() => _AnimatedContainerAppState();
}

// Classe que é construida a tela do aplicativo
class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  @override
  // Metodo de construção da tela
  Widget build(BuildContext context) {
    // Material responsável pelos widgets do android
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: Text("App Animation"),
      ),
      body: Column(
       children: [

       ], 
      ),
      ) ,
    );
  }
}