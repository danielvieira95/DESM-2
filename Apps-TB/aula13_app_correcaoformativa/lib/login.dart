import 'package:flutter/material.dart'; // pacotes do widget

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController user = TextEditingController();
  TextEditingController senha = TextEditingController();
  bool exibir = false; // variavel para exibir ou nao a senha
  @override
  Widget build(BuildContext context) {
    // Scaffold faz parte do layout do app
    return Scaffold(
      // body corpo do scaffold
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // elemento decorativo
            SizedBox(
              height:300 ,
              width: 300,
              child: Column(
                children: [
                  // textformfield para permitir que o usuário digite seu nome
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      icon: Icon(Icons.people_alt_outlined,color: Colors.blue,),
                      hintText: "Digite seu nome"),// Mensagem no text form field
                      // icone do textformfield
                      controller: user,
                     
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      icon: Icon(Icons.key_outlined,),iconColor: Colors.blue,
                      // suffix icon responsável por criar um icone no textformfield
                      // Icon button icone para o botão 
                      // exibir ? operador ternário
                      // if( exibir == true icons.visibility  else visibility off)
                      suffixIcon: IconButton(icon:  Icon(exibir ? Icons.visibility :Icons.visibility_off),onPressed: (){
                        setState(() {
                          exibir = !exibir; // inverte o estado da variavel exibir
                        });
                      }),
                      hintText: "Digite sua senha"),
                      obscureText: exibir,
                      obscuringCharacter: '*',// Mensagem no text form field
                      // icone do textformfield
                      
                      controller: senha,
                     
                    ),
                  ),
                ],
              ),
      
            )
          ],
        ),
      ),
    );
  }
}