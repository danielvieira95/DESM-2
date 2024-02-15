import 'package:flutter/material.dart';

class Telaopcoes extends StatefulWidget {
  const Telaopcoes({super.key});

  @override
  State<Telaopcoes> createState() => _TelaopcoesState();
}

class _TelaopcoesState extends State<Telaopcoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tela opções"),
          backgroundColor: Colors.green,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Tela 3",
                style: TextStyle(fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child:
                  Text("Senai Roberto Mange", style: TextStyle(fontSize: 25)),
            ),
            Container(
              color: Colors.green,
              width: 100,
              height: 100,
            ),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);

            }, child: Icon(Icons.account_circle)),
          ],
        ));
  }
}