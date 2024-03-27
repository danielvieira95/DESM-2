import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  Home({super.key});
  TextEditingController nome = TextEditingController();
  TextEditingController senha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("App aula 08 exemplo"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Center(child:Container(width: 150,height: 150,
          decoration: BoxDecoration(color: Colors.blueGrey,
          borderRadius:BorderRadius.circular(50.0),
          ),
          ),
          ),
          //borderRadius:BorderRadius.circular(30) ),),),
           // decoration permite estilizar o container adicionando bordas no container
           Container(width: 300,
           height: 200,
           decoration: BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.circular(20)),
           
           child: Column(
            children: [
              TextField(
             keyboardType: TextInputType.name,
             decoration: InputDecoration(labelText: "Digite seu nome") ,
             cursorColor: Colors.white,
             controller: nome,
              ),
              TextField(
             keyboardType: TextInputType.number,
             decoration: InputDecoration(labelText: "Digite sua senha") ,
             obscureText: true,
             obscuringCharacter: '#',
             cursorColor: Colors.white,
             controller: senha,
              ),
              ElevatedButton(onPressed: (){
                print(nome.text);
                print(senha.text);
              }, child: Icon(Icons.account_circle)),

            ],
           ),
           ),
          ],
        ),
      ),
    );
  }
}