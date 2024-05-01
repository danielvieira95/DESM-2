import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// Classe produto tela
class Produtoscreen extends StatefulWidget {
  const Produtoscreen({super.key});

  @override
  State<Produtoscreen> createState() => _ProdutoscreenState();
}

class _ProdutoscreenState extends State<Produtoscreen> {
  // função que permite os dados serem exibidos de forma automatica na tela
  void initState(){
    super.initState();
    exibeprod();

  }
  
  List dado = [];
  Future<void> exibeprod()async{
    String url = "http://10.109.83.10:3000/produtos";
    http.Response resposta = await http.get(Uri.parse(url));
     // lista de produtos prod itens
    
    if(resposta.statusCode ==200){
        setState(() {
     dado = json.decode(resposta.body) as List<dynamic>; // cria a variavel dado como lista para receber o json
    print(dado);// transforma os dados como uma lista para poder exibir
    });
    }
   
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Mercado produtos"),
      ),
      body: Center(
        child: ListView.builder(
              itemCount: dado.length, // conta o tamanho da lista de dados
              itemBuilder: (context,index){
                final item = dado[index]; // variavel item que irá armazenar os elementos da lista
                return ListTile(
                  title: Text("Nome: ${item["nome"]}",style: TextStyle(fontSize: 16),textAlign: TextAlign.center,),
                  subtitle: Column(
                    children: [
                      Text("${item["valor"]} ",style: TextStyle(fontSize: 16),),
                      Text(" ${item["qtde"]}",style: TextStyle(fontSize: 16)),
                    ],
                  ),


                );

              }),
            
            //ElevatedButton(onPressed: _exibeprod, child: Text("Exibir")),
           
            
      
      
        ),
      );
    
  }
}
// classe produto itens
class ProdItens{
  String id;
  String nome;
  String valor;
  String qtde;
  ProdItens(this.id, this.nome, this.valor, this.qtde); // construtor da classe produto
  factory ProdItens.fromJson(Map<String,dynamic>json){
    return ProdItens(json["id"],json["nome"],json["valor"],json["qtde"]);
  }
}