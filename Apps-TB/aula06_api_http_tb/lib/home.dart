import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // permite os metodos para  consumo da api
import 'dart:convert'; // pacote que permite a conversao dos dados
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController ncep = TextEditingController();
  String ? logradouro;
    String? bairro;
    String ? cidade;
    String ? estado;
    String? ddd;
  // async é porque a comunicação é assincrona
   _consultaCep () async {
    String url = "https://cep.awesomeapi.com.br/${ncep.text}";
    // api para consultar o endereço através do cep
    http.Response response; // variavel para armazenar a resposta da api
    response = await http.get(Uri.parse(url)); // response armazena a resposta da api
    print("Codigo de status da API: ${response.statusCode.toString()}"); // codigo de resposta da api
    //print("Resposta da api ${response.body}"); // resposta da api
    

    Map<String,dynamic>dados = json.decode(response.body);
    setState(() {
    logradouro = dados["address"];
    bairro = dados["district"];
    cidade= dados["city"];
    estado = dados["state"];
    ddd = dados["ddd"];
      
    }); // variavel para armazenar os dados da api
    
    print("Logradouro: $logradouro");
    print("Bairro: $bairro");
    print("cidade: $cidade - $estado");
    print("ddd: $ddd");
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Digite o cep"),
              controller: ncep ,
          
               
            ),
          ),
          Center(child: ElevatedButton(onPressed: _consultaCep, child: Text("Verificar"))),
          Text("Logradouro: $logradouro ",style: TextStyle(fontSize: 18),),
          Text("Bairro: $bairro ",style: TextStyle(fontSize: 18),),
          Text("Cidade: $cidade - $estado ",style: TextStyle(fontSize: 18),),
          Text("DDD: $ddd ",style: TextStyle(fontSize: 18),),
        ],
      ),
    );
  }
}