import 'package:app_telasmultiplas/Telasecundaria.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Telaprincipal(),
  ));
}

class Telaprincipal extends StatefulWidget {
  const Telaprincipal({super.key});

  @override
  State<Telaprincipal> createState() => TelaprincipalState();
}

class TelaprincipalState extends State<Telaprincipal> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
           
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  Telasecundaria()));
                  // route,
                  // Widget que permite navegação entre telas
                },
                child: Text("Tela 2")),
            ],
          ),
        ),
      );
    
  }
}