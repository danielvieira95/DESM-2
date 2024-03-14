import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App consulta preço BitCoin"),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 250,height: 150,color: Colors.amber,),
           Text("Valor BitCoin R\$: ",style: TextStyle(fontSize: 20),),
           ElevatedButton(onPressed: (){}, child: Text("Verificar")),
          ],
        ),
      ),
    );
  }
}