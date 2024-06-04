import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart'; // pacote que permite criar uma tela de boas vindas
import 'package:page_transition/page_transition.dart'; // pacote para transição de pagina 
void main() {
  runApp(MaterialApp(
    home: AnimatedSplashScreen(
      duration: 10000, // tempo de duração da animação
      //splash: Icons.home, // icone que será animado
      splash: Image.asset('imagens/senai.png'),
      nextScreen: Telaprincipal(), // chama a próxima tela
      //splashTransition: SplashTransition.fadeTransition, // transição splash
      //splashTransition: SplashTransition.scaleTransition, // transição splash
      splashTransition: SplashTransition.rotationTransition, // transição splash
      pageTransitionType: PageTransitionType.bottomToTop, // transição para a proxima tela
      backgroundColor: Colors.purple, // cor do fundo da tela
    ),
  ));
}

class Telaprincipal extends StatelessWidget {
  const Telaprincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App aula 18"
        
        ),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            ElevatedButton(onPressed: (){
              print("Mobile 2");
        
            }, child: Text("Mensagem")),
            Container(width: 200,height: 200,child: Image.asset('imagens/senai.png',fit: BoxFit.fill,)),
            // fit escala da imagem
        
          ],
        
        ),
      ),
    );
  }
}

