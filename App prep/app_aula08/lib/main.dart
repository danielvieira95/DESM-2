import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() {
  runApp(MaterialApp(
  home: Home()  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? dados;
  String? nome ;
  String? n1,n2,n3,n4,n5,n6,n7;
  
  String? idade;
  _consultapets() async{
    //String url = "https://raw.githubusercontent.com/alura-cursos/obtendo_dados_com_flutter_http/main/filmes.json";
    String url = "https://raw.githubusercontent.com/giovannamoeller/pets-api/main/db.json";
    http.Response response = await http.get(Uri.parse(url));
    Map<String,dynamic> dados = json.decode(response.body);
   //print(response.body);
    //List <String> dados = json.decode(response.body);
    //print(dados.toString());
   //print(response.body);
  //print(dados["pets"][0]);
  //print(dados["pets"][1]);
  setState(() {
    nome = dados["pets"][2]["name"];
    n1=dados["pets"][0]["name"];
    n2=dados["pets"][1]["name"];
    n3=dados["pets"][2]["name"];
    n4=dados["pets"][3]["name"];
    n5=dados["pets"][4]["name"];
    n6=dados["pets"][5]["name"]["age"];
  });
  
  for(int i=0; i<7; i++)
  {
     
     
     idade = dados["pets"][1]["age"];
     print("${dados["pets"][i]["name"]}, ${dados["pets"][i]["age"]}");
     
  }
  
  //nome = dados["pets"][1]["name"];
  //print(nome);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("App Consulta filme"),
      ),
      body: Column(
        children: [
          
          ElevatedButton(onPressed: _consultapets, child: Text("Consultar")),
          Text("Nome ${n1}"),
          Text("Nome ${n2}"),
          Text("Nome ${n3}"),
          Text("Nome ${n4}"),
          Text("Nome ${n5}"),
          Text("Nome ${n6}"),

        ],
      ),
    );
  }
}

class Filme {
  String nome;
  String imagem;

  Filme({
    required this.nome,
    required this.imagem,
  });

  Filme.fromJson(Map<String, dynamic> json)
      : nome = json['nome'].toString(),
        imagem = json['imagem'].toString();
}

 