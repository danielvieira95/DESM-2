import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // importa o pacote http para consumo da api
import 'dart:convert'; // metodo para converter dado json
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // async é porque a função vai esperar uma resposta da api pelo metodo http.get
  _consultaprecoBitCoin() async{

    String url =  "https://blockchain.info/ticker"; // url com a api 
    http.Response response = await http.get(Uri.parse(url));
    Map<String,dynamic> dados = json.decode(response.body); // decodifica a informação
    //vinda da api


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversor de moedas "),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}