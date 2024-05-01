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
    _exibeprod();

  }
  
  List dado = <ProdItens>[];
  _exibeprod()async{
    String url = "http://10.109.83.10:3000/produtos";
    http.Response resposta = await http.get(Uri.parse(url));
     // lista de produtos prod itens
    
    if(resposta.statusCode ==200){
        setState(() {
     = json.decode(resposta.body) as List<dynamic>; // cria a variavel dado como lista para receber o json
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Column(
                  children: prod.map((produto) => Text(
                          "${produto.nome} - R\$ ${produto.valor} - ${produto.qtde}",
                          style: TextStyle(fontSize: 18))).toList(),
                ),
            ElevatedButton(onPressed: _exibeprod, child: Text("Exibir")),
            ElevatedButton(onPressed: (){}, child: Text("Prod Screen"))
            
      
          ],
        ),
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