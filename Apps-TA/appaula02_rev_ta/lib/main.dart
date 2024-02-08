import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

// Classe Home do tipo Stateless
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
           // Material app necessário para construir os widgets
    return MaterialApp(
      home: Scaffold(
       appBar: AppBar(
        title:  Text("Aplicativo aula 02 - TA"),
       ), 
       body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(color: Colors.red,
          width: 200,
          height:250,  
          child: Text("Senai",style: TextStyle(fontSize: 30),),      
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: (){
                print("Botão pressionado");
              }, child: Text("Mensagem")),
              ElevatedButton(onPressed: (){
            print("SENAI");
          }, child: Text("SENAI")),
            ],
          ),
         Column(
          children: [
            Container(color: Colors.blue,
            height: 100,
            width: 200,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Mobile 2"),
                    Text("Senai"),
                  ],
                  
                ),
                Text("Daniel"),
              ],
            ),
            ),
          ],
         )
        ],
       ),
      ) ,
    );
  }
}
