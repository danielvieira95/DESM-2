import 'package:flutter/material.dart';

class Tela2 extends StatefulWidget {
  const Tela2({super.key});

  @override
  State<Tela2> createState() => _Tela2State();
}
int cont =0;

  
  

class _Tela2State extends State<Tela2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela 2"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(color: Colors.red,height: 150,width: 150,
          child: Text("$cont"),
          ),
         ElevatedButton(onPressed: (){
          
          setState(() {
            cont+=1;

            
          });}, child: Text("Contagem")),
         
        ],
      ),
      );
  }
}


              
         
          