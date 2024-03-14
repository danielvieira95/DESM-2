import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // pacote que irá permitir utilizar as funções
// para consumo da api
import 'dart:convert'; // Metodo que permite a conversao de dados
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController ncep =TextEditingController();
  String? logradouro;
  String? bairro;
  String? cidade;
  String? ddd;
  String? estado;
  // async funçao assincrona
 _consultaCep() async {
  String url = "https://viacep.com.br/ws/13060350/json/";
  String url2 = "https://cep.awesomeapi.com.br/${ncep.text}";
  http.Response response; // variavel que será responsável por armazenar a resposta da api
  response = await http.get(Uri.parse(url2)); // response está armazenando os dados que vierem pela api
  Map<String,dynamic>dados = json.decode(response.body); // variavel dados para armazenar 
  // a informação decodificada
  setState(() {
    logradouro = dados["address"];
   bairro = dados["district"];
  cidade = dados["city"];
   ddd = dados["ddd"];
   estado = dados['state'];
  });
  
  print("Codigo de status da api ${response.statusCode.toString()}");
  print("Resposta da api");
 // print("${response.body}");
  print("Logradouro: ${logradouro}");
  print("Bairro: ${bairro}");
  print("Cidade: ${cidade} - ${estado}");
  print("DDD: ${ddd}");
  print(ncep.text);

 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App consulta CEP"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: "Digite o Cep"),
          controller: ncep,
          ),
          Center(child: ElevatedButton(onPressed: _consultaCep, child: Text("Consultar"))),
          
          Text("Endereço: ",style: TextStyle(fontSize: 18),),
          Text("Logradouro: ${logradouro}",style: TextStyle(fontSize: 18),),
          Text("Bairro: ${bairro}",style: TextStyle(fontSize: 18),),
          Text("Cidade: ${cidade} - ${estado}",style: TextStyle(fontSize: 18),),
          Text("DDD: ${ddd}",style: TextStyle(fontSize: 18),),
          
        ],
      ),
    );
  }
}