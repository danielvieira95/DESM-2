import 'package:flutter/material.dart';
import 'dart:math'; // importa o pacote para fazer operações matemáticas, conversoes de valores
void main() {
  runApp(AnimatedContainerApp());
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        
       Center(
        // AnimatedContainer é um widget
        child: AnimatedContainer(
          width: widget.width, // sempre a variavel for declarada fora da classe atual se quiser
          // chamá-la precisamos utilizar widget.nome da variavel
          height: widget.height,
          // decoration para estilizar o widget
          // BoxDecoration para estilizar o widget da forma desejada
          decoration: BoxDecoration(
          color: widget.color, // cor
          borderRadius: widget.borderRadius, // estilo da borda do container
          ),
         duration: Duration(seconds: 1), // duração da animação
         curve: Curves.fastOutSlowIn, // tipo de animação do widget
        ),
       ),
       // botão do tipo flutuante na tela
       FloatingActionButton(onPressed: (){
        setState(() {
          final random = Random(); // variavel do tipo final que irá receber um numero randomico gerado
          // pela funçao random
          widget.height = random.nextInt(300).toDouble(); // valor random gerado com no máximo 300 do tipo inteiro
          // convertido para double
          widget.width = random.nextInt(300).toDouble();
          // gerar cores aleatórias para os containers gerados
          widget.color =Color.fromRGBO(
            random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
            // borda do container
            widget.borderRadius = BorderRadius.circular(random.nextInt(100).toDouble()); // altera a borda
            // do container


        });
       },child: Icon(Icons.play_arrow),),
       Snack_bar(), // Icon permite escolher um icone para o botao
       ], 
      ),
      ) ,
    );
  }
}

class Snack_bar extends StatelessWidget {
  const Snack_bar({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      // variavel final chamada snack 
      final snack = SnackBar(
        content: Text("Exemplo Snackbar"),
        // açao do snackbar
        action: SnackBarAction(
          label: "Undo",
           
          onPressed: (){

          }),
        );
        // ScaffoldMessenger é ele quem irá acionar o snackbar
          ScaffoldMessenger.of(context).showSnackBar(snack);
    }, child: Text("Mensagem"));
  }
}