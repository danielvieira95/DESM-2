import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();

}
class _HomeState extends State<Home> {
  
  String url = "192.168.15.10:3000/produtos";
  String url2 = 'https://raw.githubusercontent.com/giovannamoeller/pets-api/main/db.json';
// String url= 'https://raw.githubusercontent.com/danielvieira95/DESM-2/master/App%20prep/db.json';
  String? nome_0,nome_1, nome_2,nome_3;
  
  _consultaapi()async{
    
    http.Response resposta= await http.get(Uri.parse('http://192.168.15.10:3000/0'));
   //List<dynamic> dados = json.decode(resposta.body);
   //Map<String,dynamic> dados = jsonDecode(resposta.body);
   // print(resposta.body);
    //String url = "localhost:3000/produtos";
    
    if(resposta.statusCode==200){
    
      //print(resposta.body);
      
      //Map<String,dynamic> jsonlist= json.decode(resposta.body);
    
       //print(jsonlist);
      // print(jsonlist["produtos"][1]);
       //print(dados[i]);
      final parsed = jsonDecode(resposta.body);
      List<dynamic> produtosJson = parsed['produtos'];
     
       print(produtosJson[0]);
       print(produtosJson[1]);
       print(produtosJson[2]);
       print(produtosJson[3]);
       print(produtosJson);
     return produtosJson.map((json) => Produto.fromJson(json)).toList();
      
      
     
      
      //print(resposta.body);
    
    

   // print(resposta.body);
  }
  }

  publicarPost()async {
  Map<String,dynamic> x={
    "Disciplina":"Desenvolvimento Mobile",
    "Curso":"Ads",
    "Escola": "Senai Roberto Mange"
  };

  final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(x),
    );

    print("Post");

  }
  
 //final Produto produto  ;
 // produto({Key? key, required this.nome}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App post"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Aplicativo post http",style: TextStyle(fontSize: 18),),
          ElevatedButton(onPressed: _consultaapi, child: Text("Ler")),
          ElevatedButton(onPressed: publicarPost, child: Text("Enviar")),
        Text("a",style: TextStyle(fontSize: 18),),

        ],
        ),
      ),
    );
  }
}


class Produto{
final String nome;
final String id;
final String valor;
Produto({required this.nome, required this.id, required this.valor});
factory Produto.fromJson(Map<String,dynamic> json){
  return Produto(
    nome: json['nome'],
     id:json['id'],
      valor:json['valor']);
}

}