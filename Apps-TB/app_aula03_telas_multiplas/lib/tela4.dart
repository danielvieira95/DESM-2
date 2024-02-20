import 'package:flutter/material.dart';

class telacontador extends StatefulWidget {
  const telacontador({super.key});

  @override
  State<telacontador> createState() => telacontadorState();
}

class telacontadorState extends State<telacontador> {
  int cont =0;
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contador"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(color:  Colors.blueAccent,width: 100,height: 100,
            child: Text("Contagem "+ " $cont",style: TextStyle(fontSize: 20),),),
          ),
          ElevatedButton(onPressed: (){
            // Set state atualiza o valor da variavel com base no estado
            setState(() {
              cont++;
              
            });
          }, child: Icon(Icons.add)), // Adiciona icone no botão
        ],
      ),
    );
  }
}

