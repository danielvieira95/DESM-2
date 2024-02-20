import 'package:flutter/material.dart';

class campotexto extends StatelessWidget {
  const campotexto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Campo texto"),
      ),
      body: Column(
        children: [
          // Text field é o campo texto
          TextField(
            // keyboard type é o tipo de entrada do campo texto
           keyboardType: TextInputType.name,
           decoration: InputDecoration(labelText: "Digite seu nome"), // decoration é uma mensagem no campo texto
           // Tudo que digita aparece no terminal
           /*onChanged: (String texto){
            print(texto);
           }
           */ 
          onSubmitted: (String texto){
            print(texto);

          }


          )
        ],
      ),
    );
  }
}