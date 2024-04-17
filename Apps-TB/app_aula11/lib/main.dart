import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // método para realizar a conversão do dado consumido da api
void main() {
  // Material app é por necessário por conta do material design
  // home vai chamar a tela
  // runApp função que inicia a chamada da tela para o app
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
  String url = "http://10.109.83.10:3000/produtos"; // url que será consumida para realizar os métodos
   // async função assincrona
   List dado =[];
   var produtos = <Produto>[]; // variavel produtos está criando uma lista do tipo produto vazia
   //List<int> valor =[]; exemplo lista com numero inteiro 

  _getdado()async{
    // http.response método que cria uma variavel para resposta da api
    // await é porque a função é assincrona
    // método para fazer requisição get http.get
    // Uri.parse é necessário para o http.get
    http.Response resposta = await http.get(Uri.parse(url)); 
   // var dado =json.decode(resposta.body); // json decode faz a conversão do dado para json
   dado = json.decode(resposta.body);
   // List cria um dado do tipo lista para receber a informação json
   //Map<String,dynamic> dado = json.decode(resposta.body) as List;
   // print a lista de produtos
    for(int i =0; i<dado.length; i++)
    {
      print(dado[i]);
    }
    setState(() {
      // dado.map vai converter nosso json em uma lista
      produtos = dado.map((json) => Produto.fromJson(json)).toList();
    });
   
  }
  _post(){
    // estrutura do dado a ser publicado
    Map<String,dynamic>mensagem={
      //"id": "6",
      "nome":"PS5",
      "valor": "3700"
    };
    Map<String,dynamic>msg2={
      //"id": "6",
      "nome":"Mac Pro",
      "valor": "15000"
    };
    // Metodo http post para realizar uma requisição 
    // http post Uri parse, headers. body
    http.post(
      Uri.parse(url),
      headers: <String,String>{
        'Content-type':'application/json; charset=UTF-8',
      },
      //body:jsonEncode(mensagem) , // transforma a mensagem para o formato json para fazer o post
      body: jsonEncode(msg2),
    );
  }
  _deletepost(){
    // http delete é o metodo utilizado para deletar um produto da api
    http.delete(Uri.parse('http://10.109.83.10:3000/produtos/5f01'));
  }
  // put 
  // Url, header, body
  // Json Encode formata a mensagem
  _put(){
    http.put(Uri.parse('http://10.109.83.10:3000/produtos/736a'),
    headers: <String, String>{
      'Content-type': 'application/json; charset=UTF-8', 
    },
    body: jsonEncode({"id":"8", "nome":"Xbox Series X","valor":"2500"}),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("App http métodos"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Get, Post, Put, delete http", style: TextStyle(fontSize: 18),),
            ElevatedButton(onPressed: _getdado, child: Text("Ler")), 
            ElevatedButton(onPressed: _post, child: Text("Publicar")),
            ElevatedButton(onPressed: _deletepost, child: Text("Deletar")),
            ElevatedButton(onPressed: _put, child: Text("Alterar")),
            
            Column(
              // exibe os dados no text
              // map faz o mapeamento dos dados na lista
              children:produtos.map((produto)=>Text("${produto.nome} - R\$ ${produto.valor}",
              style: TextStyle(fontSize: 18),)).toList(),
            
            ),
          ],
        ),
      ),
    );
  }
}

class Produto{
  String id;
  String nome;
  String valor;
  Produto(this.id, this.nome, this.valor);
  // Função factory é a função responsável por decodificar o dado json consumido através da api
  factory Produto.fromJson(Map<String,dynamic>json){
    return Produto(json["id"],json["nome"],json["valor"]);

  }  
}
// Classe produto_n para armazenar a lista total de produtos
class Produto_n{
  List prod =[];
  Produto_n(this.prod);
}