import 'package:app_aula03_telas_multiplas/tela4.dart';
import 'package:flutter/material.dart';

class Telaop extends StatelessWidget {
  const Telaop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Tela opções"),
      ),
     body: Column(
      children: [
        Container(color: Colors.black,width: 400,height: 180,),
        ElevatedButton(onPressed: (){
        Navigator.pop(context);

        }, child: Text("Tela 2")),
        ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>telacontador()));

        }, child: Text("Contador"))
      ],
     ),

    );
  }
}