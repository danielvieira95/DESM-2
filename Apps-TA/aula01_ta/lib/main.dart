import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home:  
    Scaffold(
      appBar: AppBar(
        title: Text("App - Aula 01 - Mobile 2"),
      ),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
          color: Colors.blue,
          width: 200,
          height: 100,
          child: Text("Mobile 2",style: TextStyle(fontSize: 30),
          textAlign: TextAlign.center,),
          ),
          Container(
            color: Colors.red,
            width: 200,
            height: 100
            ,),
      
             ElevatedButton(onPressed: (){
              print("Botão pressionado");
             }, child: Text("Mensagem")),
      
          ],),
      ),
    ),   
    
  ),);
}

