import 'package:flutter/material.dart';

void main() {
  runApp(Telaprincipal());
}

class Telaprincipal extends StatefulWidget {
  const Telaprincipal({super.key});

  @override
  State<Telaprincipal> createState() => TelaprincipalState();
}

class TelaprincipalState extends State<Telaprincipal> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("App multiplas telas"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Container(color: Colors.blue,
            width: 150,
            height: 150,),
            ],
          ),
        ),
      ),
    );
  }
}