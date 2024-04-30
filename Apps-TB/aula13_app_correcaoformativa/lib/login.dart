import 'package:flutter/material.dart'; // pacotes do widget

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController user = TextEditingController();
  TextEditingController senha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Scaffold faz parte do layout do app
    return Scaffold(
      // body corpo do scaffold
      body: Column(
        children: [
          // elemento decorativo
          SizedBox(
            height:300 ,
            width: 300,
            child: Column(
              children: [
                // textformfield para permitir que o usuário digite seu nome
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  icon: Icon(Icons.people_alt_outlined,color: Colors.blue,),
                  hintText: "Digite seu nome"),// Mensagem no text form field
                  // icone do textformfield
                  controller: user,
                 
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  icon: Icon(Icons.key_outlined,color: Colors.blue,),
                  hintText: "Digite sua senha"),// Mensagem no text form field
                  // icone do textformfield
                  controller: senha,
                 
                ),
              ],
            ),

          )
        ],
      ),
    );
  }
}