import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // permite os metodos para
// consumo da api
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // async é porque a comunicação é assincrona
   _consultaCep () async {
    String url = "https://cep.awesomeapi.com.br/13060354";
    // api para consultar o endereço através do cep
    http.Response response; // variavel para armazenar a resposta da api
    response = await http.get(Uri.parse(url)); // response armazena a resposta da api
    print("Codigo de status da API: ${response.statusCode.toString()}"); // codigo de resposta da api
    print("Resposta da api ${response.body}"); // resposta da api
    

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App consulta CEP"),
        
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: _consultaCep, child: Text("Verificar"))

        ],
      ),
    );
  }
}