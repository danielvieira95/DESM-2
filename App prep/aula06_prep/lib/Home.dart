
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // metodo que permite converter o dado json
class Home extends StatefulWidget {
  
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // comunicação sincrona e assincrona

   String? logradouro ;
  String? complemento ;
  String? bairro;
  String? localidade ;
  String? ddd;
  _consultaCep() async  {
    
    String url = "https://viacep.com.br/ws/13060380/json/";
    //String url = "https://viacep.com.br/ws/13060354/json/";
    http.Response response; // variavel para receber dados da api
    response = await http.get(Uri.parse(url)); // await aguardar a resposta
    Map<String,dynamic> retorno = json.decode(response.body);
    setState(() {
       logradouro = retorno["logradouro"];
       complemento = retorno["complemento"];
       bairro = retorno["bairro"];
       localidade = retorno["localidade"];
       ddd = retorno["ddd"];
      
    });
      
   
    //print("Endereço");
    //print("Logradouro: ${logradouro}");
    //print("Complemento: ${complemento}");
    //print("Bairro: ${bairro}");
    //print("Localidade: ${localidade}");
   // print("DDD: ${ddd}");
    print("resposta "+response.statusCode.toString());
   print("resposta " + response.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço web"),
      ),
      body: Container(
      padding: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: ElevatedButton(onPressed: _consultaCep, child: Text("Consulta Cep"))),
          Text("Logradouro: ${logradouro}",style: TextStyle(fontSize: 20),),
          Text(
                "Complemento: ${complemento}",
                style: TextStyle(fontSize: 20),
              ),
          Text(
                "DDD: ${ddd}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Bairro: ${bairro}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Localidade: ${localidade}",
                style: TextStyle(fontSize: 20),
              ),
        ],

      ),
      )
      
    );
  }
}