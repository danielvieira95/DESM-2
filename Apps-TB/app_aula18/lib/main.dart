import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart'; // pacote que permite criar uma tela de boas vindas
import 'package:page_transition/page_transition.dart'; // pacote para transição de pagina 
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AnimatedSplashScreen(
      duration: 1000, // tempo de duração da animação
      //splash: Icons.home, // icone que será animado
      splash: Image.asset('imagens/senai.png'),
      splashIconSize: 400,
      nextScreen: Telaprincipal(), // chama a próxima tela
      //splashTransition: SplashTransition.fadeTransition, // transição splash
      //splashTransition: SplashTransition.scaleTransition, // transição splash
      splashTransition: SplashTransition.rotationTransition, // transição splash
      pageTransitionType: PageTransitionType.bottomToTop, // transição para a proxima tela
      backgroundColor: Colors.red, // cor do fundo da tela
    ),
  ));
}

class Telaprincipal extends StatefulWidget {
  @override
  State<Telaprincipal> createState() => _TelaprincipalState();
}

class _TelaprincipalState extends State<Telaprincipal> {
  TextEditingController nome = TextEditingController();
  TextEditingController idade = TextEditingController();
  String? nome_t;
  String ?idade_t;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // elimina erro de overflow
      appBar: AppBar(
        title: Text("App aula 18"
        
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Container(width: 200,height: 200,child: Image.asset('imagens/senai.png',fit: BoxFit.fill,)),
            // fit escala da imagem
            
            
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: "Digite seu nome"
              ),
              controller: nome,
            
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: idade,
              decoration: InputDecoration(
                hintText: "Digite sua idade"
              ),
            ),
            ElevatedButton(onPressed: (){
              print("Mobile 2");
              setState(() {
                nome_t = nome.text;
                idade_t = idade.text;
                
              });
              
        
            }, child: Text("Mensagem")),
            Text("${nome_t}",style: TextStyle(fontSize: 18),),
            Text("${idade_t}",style: TextStyle(fontSize: 18),)
          ],
        
        ),
      ),
    );
  }
}

