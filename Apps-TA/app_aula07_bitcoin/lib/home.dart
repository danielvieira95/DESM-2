import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String preco = "0";
  _consultaBitCoin() async{
    String url = "https://blockchain.info/ticker"; // url com a api 
    http.Response response = await http.get(Uri.parse(url)) ; // espera o retorno da api
    Map<String, dynamic> dados = json.decode(response.body); // decodifica o dado da api
    setState(() {
       preco = dados["BRL"]["buy"].toString(); // faz o parse da informação
    });   
    print("Resultado api ${response.statusCode.toString()}");
    print("Valores BitCoin ${dados}");
    print("Valor do bitcoin em R\$ ${preco}");
     
  }
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
           Text("Valor BitCoin R\$: $preco ",style: TextStyle(fontSize: 20),),
           ElevatedButton(onPressed: _consultaBitCoin, child: Text("Verificar")),
          ],
        ),
      ),
    );
  }
}