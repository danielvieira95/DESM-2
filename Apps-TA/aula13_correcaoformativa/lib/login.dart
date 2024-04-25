import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController user = TextEditingController();
  TextEditingController senha = TextEditingController();
  bool exibir = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("App Mercado"),
      ),
      body: Column(
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.name, // define o tipo de entrada do teclado
                  decoration: InputDecoration(border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  icon: Icon(Icons.people_alt_outlined),iconColor: Colors.blue,
                  hintText: "Digite seu nome"
                  
                  ),
                  controller: ,
                  


                ),
                TextFormField(
                  keyboardType: TextInputType.name, // define o tipo de entrada do teclado
                  decoration: InputDecoration(border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  icon: Icon(Icons.key),iconColor: Colors.blue,
                  hintText: "Digite sua senha"
                  
                  ),
                  


                ),

              ],
            ),

          ),

        ],

      ),
    );
  }
}