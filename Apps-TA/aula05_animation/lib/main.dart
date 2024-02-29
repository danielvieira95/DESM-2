
import 'dart:math'; // importa o pacote math que permite realizar operações matemáticas numero pi, 
import 'package:flutter/material.dart';

void main() {
  runApp(AnimatedContainerApp());
}

class AnimatedContainerApp extends StatefulWidget {
 //  AnimatedContainerApp({super.key});
 double _width = 50; // variavel do tipo double largura do container
 double _height =50; // variavel do tipo double altura do container
 Color _color = Colors.green; // variavel do tipo color para alterar a cor do container
 BorderRadiusGeometry _borderRadius = BorderRadius.circular(8); // variavel para alterar a borda do container
  @override
  State<AnimatedContainerApp> createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Animated Container App"),
          backgroundColor: Colors.cyan, //altera cor do app bar
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: AnimatedContainer(
                width: widget._width,
                height: widget._height,
                decoration: BoxDecoration(
                  color: widget._color,
                  borderRadius: widget._borderRadius,
                ),
                duration: const Duration(seconds: 1), // tempo de animação
                curve: Curves.fastOutSlowIn, // Curva no container

              ),
            ),
            // botão flutuante
            FloatingActionButton(onPressed: (){
              setState(() {
                final  random = Random(); // variavel que recebe um valor randomico
                widget._height = random.nextInt(300).toDouble(); // typecast para conversao de dados
                widget._width = random.nextInt(300).toDouble(); // typecast para conversão de dados
                // gera cores aleatórias a cada clique do botao floating action
                widget._color = Color.fromRGBO(
                  random.nextInt(256),random.nextInt(256),random.nextInt(256),1);
                   widget._borderRadius =  BorderRadius.circular(random.nextInt(100).toDouble());
              });
            },child: Icon(Icons.play_arrow),), // icone do botao

          ],
        ),
      ),
    );
  }
}