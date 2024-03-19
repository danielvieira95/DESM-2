import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // importa o pacote http para consumo da api
import 'dart:convert'; // metodo para converter dado json
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _precobit; // variavel para armazenar o valor do bitcoin
  // async é porque a função vai esperar uma resposta da api pelo metodo http.get
  _consultaprecoBitCoin() async{

    String url =  "https://blockchain.info/ticker"; // url com a api 
    http.Response response = await http.get(Uri.parse(url));
    Map<String,dynamic> dados = json.decode(response.body); // decodifica a informação
    //vinda da api
    print("Codigo de status da resposta da api ${response.statusCode.toString()}");
    setState(() {
       _precobit =dados["BRL"]["buy"].toString();
    });
   
    print(_precobit);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversor de moedas "),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(width: 400,height: 200,color:Colors.amber,child: Image.asset("imagens/bitcoin.png"),),
            ),
           Text("Valor do BitCoin R\$ ${_precobit}",style: TextStyle(fontSize: 18),),
           ElevatedButton(onPressed: _consultaprecoBitCoin, child: Text("Verificar")),

          ],
        ),
      ),
    );
  }
}