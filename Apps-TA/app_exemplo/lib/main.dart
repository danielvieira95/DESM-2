import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController login = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("App"),
        ),
        body: Column(
        children: [
          SizedBox(
            child: TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(labelText: "Digite seu nome"),
              controller: login ,
            ),
            width: 300,
            height: 100,
          ),
          Container(width: 400,height: 200,child: 
          Column(
            children: [
               TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(labelText: "Digite seu nome"),
              controller: login ,),
              TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(labelText: "Digite seu nome"),
              controller: login ,),
            ],

          ),decoration: BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.circular(12)),),
           
              
              
              
              
              

          
          
          
        ],
        ),
      ),
    );
  }
}