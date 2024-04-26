import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Produtos extends StatefulWidget {
  const Produtos({super.key});

  @override
  State<Produtos> createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  _leituradados() async{

    String url = "http://10.109.83.10:3000/produtos";
    http.Response resposta = await http.get(Uri.parse(url));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP Mercado"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){}, child: Text("Exibir")),
        ],
      ),
    );
  }
}

class Produto_item{
  String id;
  String nome;
  String valor;
  String qtde;
  Produto_item(this.id, this.nome, this.valor, this.qtde);
  factory Produto_item.fromJson(Map<String, dynamic> json){
    return Produto_item(json["id"],json["nome"],json["valor"],json["qtde"]);
  }
}