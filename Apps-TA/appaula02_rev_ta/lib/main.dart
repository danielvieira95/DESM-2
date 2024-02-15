import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

// Classe Home do tipo Stateless
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? texto;
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
          child: Text("${texto}",style: TextStyle(fontSize: 30),),      
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: (){
                print("Botão pressionado");
                setState(() {
                  texto = "Senai Roberto Mange";
                });
              }, child: Text("Mensagem")),
              ElevatedButton(onPressed: (){
            print("SENAI");
             setState(() {
                  texto = "Mobile 2";
                });
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
