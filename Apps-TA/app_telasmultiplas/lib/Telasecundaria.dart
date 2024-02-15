import 'package:app_telasmultiplas/Telaopcoes.dart';
import 'package:flutter/material.dart';

class Telasecundaria extends StatefulWidget {
  const Telasecundaria({super.key});

  @override
  State<Telasecundaria> createState() => _TelasecundariaState();
}

class _TelasecundariaState extends State<Telasecundaria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela 2"),
      ),
     body: Column(
      children: [
        Container(color: Colors.red,
        height: 150,
        width: 150,

        ),
        ElevatedButton(onPressed: (){
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => Telaopcoes()));

        }, child: Text("Tela 3")),

        
      ],
     ),

      );
    
  }
}