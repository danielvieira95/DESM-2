import 'dart:convert';

import 'package:aula13_correcaoformativa/prod.dart';
import 'package:aula13_correcaoformativa/produto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Cadastroproduto extends StatefulWidget {
  const Cadastroproduto({super.key});

  @override
  State<Cadastroproduto> createState() => _CadastroprodutoState();
}

class _CadastroprodutoState extends State<Cadastroproduto> {
  TextEditingController nomeprod = TextEditingController();
  TextEditingController valor = TextEditingController();
  TextEditingController qtde = TextEditingController();
  _produtocadastro(){
    // Estrutura para fazer do pacote a ser publicado
    Map<String,dynamic> produto={
      "id": nomeprod.text,
      "nome": nomeprod.text,
      "valor": valor.text,
      "qtde": qtde.text

    };
    String url = "http://10.109.83.10:3000/produtos";
    http.post(Uri.parse(url),
    headers:<String,String>{
      'Content-type': 'application/json; charset=UTF-8',
    } ,
    body: jsonEncode(produto)
    );
    print("Produto cadastrado");
    nomeprod.text ="";
    valor.text = "";
    qtde.text = "";
    showDialog(
          context: context,
          builder: (BuildContext) {
            return AlertDialog(
              content: Text('Produto cadastrado ${nomeprod.text}'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Fechar'))
              ],
            );
          });
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Mercado - Cadastro produtos"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),
              ),
              hintText: "Digite o nome do produto"
              ),
              
              controller: nomeprod,
            ),
          ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextFormField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              hintText: "Digite o valor do produto"
              ),
              controller: valor,
                     ),
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextFormField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              hintText: "Digite a quantidade do produto"),
              controller: qtde,
                     ),
           ),
           ElevatedButton(onPressed: _produtocadastro, child: Text("Cadastrar")),
           ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Produtos()));
           }, child: Text('Exibir')),
           ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Produto_screen()));

           }, child: Text("Screen produtos"))

        ],
      ),
    );
  }
}