import 'package:flutter/material.dart';
import 'package:http/http.dart'  as http; // permite os metodos para  consumo da api
import 'dart:convert'; // pacote que permite a conversao dos dados


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _preco = "0";
  String? nome;
  void _recupera_preco() async{
    
    String url = "https://blockchain.info/ticker";
    //String url = "https://raw.githubusercontent.com/giovannamoeller/pets-api/main/db.json";
     //String url = "https://raw.githubusercontent.com/alura-cursos/obtendo_dados_com_flutter_http/main/filmes.json";
     
    http.Response response = await http.get(Uri.parse(url));

    Map<String, dynamic> dados = json.decode(response.body);    
        setState(() {
      _preco = dados["BRL"]["buy"].toString();
    // _preco = "50";
    });

    //print("Resultado : " + dados["BRL"]["buy"].toString());
    print(response.body);
    //nome = dados["nome"];
//print(nome);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.amber,
        title: Text("App BitCoin consulta"),
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(width: 250,height: 150,color: Colors.amber,
            child: Image.asset('imagens/bitcoin.png',),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Valor do BitCoin: ${_preco}", style: TextStyle(fontSize: 20),),
            ),
            ElevatedButton(onPressed: _recupera_preco, child: Text("Consultar")),
      
          ],
        ),
      ),
    );
  }
}