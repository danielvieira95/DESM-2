import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// Classe produto tela
class Produto extends StatefulWidget {
  const Produto({super.key});

  @override
  State<Produto> createState() => _ProdutoState();
}

class _ProdutoState extends State<Produto> {
  _exibeprod()async{
    String url = "http://10.109.83.10:3000/produtos";
    http.Response resposta = await http.get(Uri.parse(url));
    List prod = <ProdItens>[]; // lista de produtos prod itens
    List dado = json.decode(resposta.body) as List; // cria a variavel dado como lista para receber o json
    print(dado);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Mercado produtos"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: _exibeprod, child: Text("Exibir")),

        ],
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