import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MaterialApp(
    title:  'App aula 16',
    // AnimatedSplashScreen define o tipo de animação da entrada do app
    home: AnimatedSplashScreen(
      duration: 3000, // tempo de duração
      splash: Icons.home, // qual elemento será colocado no splash icone, texto, imagem
       nextScreen: MainScreen(), // chama a próxima tela
      splashTransition: SplashTransition.fadeTransition, // escolhe o tipo de transição
      pageTransitionType: PageTransitionType.leftToRight, // define o tipo de transição para a página
      backgroundColor: Colors.purple, // cor do fundo da tela splash
      ),
  ));
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('App Aula 16'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              print('Teste');
            }, child: Text('Mensagem')),
        
          ],
        ),
      ),
    );
  }
}