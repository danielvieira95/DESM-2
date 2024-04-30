import 'package:flutter/material.dart'; // pacotes do widget

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    // Scaffold faz parte do layout do app
    return Scaffold(
      // body corpo do scaffold
      body: Column(
        children: [
          // elemento decorativo
          SizedBox(
            height:300 ,
            width: 300,
            child: Column(
              children: [
                // textformfield para permitir que o usuário digite seu nome
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  icon: Icon(Icons.people_alt_outlined)),// icone do textformfield
                ),
              ],
            ),

          )
        ],
      ),
    );
  }
}