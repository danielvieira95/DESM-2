import 'package:flutter/material.dart';

void main() {
  runApp(Telaprincipal());
}

class Telaprincipal extends StatelessWidget {
  const Telaprincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Campotexto() ,
    );
  }
}

class Campotexto extends StatefulWidget {
  const Campotexto({super.key});

  @override
  State<Campotexto> createState() => CampotextoState();
}

class CampotextoState extends State<Campotexto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text("Aplicativo Caixa de texto"),
      ),
      body: Column(
       children: [
        // Campo texto
        TextField(
        keyboardType: TextInputType.name,
        decoration: InputDecoration(labelText: "Digite seu nome"),
        // On changed exibe no terminal tudo que for digitado
       /* onChanged: (String texto){
         print(texto);
        },*/
        onSubmitted: (String texto){
          print(texto);
        },
        ),
       ], 
      ),
    );
  }
}
