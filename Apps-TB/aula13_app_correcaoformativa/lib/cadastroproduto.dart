import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Cadastroproduto extends StatefulWidget {
  const Cadastroproduto({super.key});

  @override
  State<Cadastroproduto> createState() => _CadastroprodutoState();
}

class _CadastroprodutoState extends State<Cadastroproduto> {
  TextEditingController nomeprod = TextEditingController(); // nome do produto
  TextEditingController valorprod = TextEditingController();
  TextEditingController qtde = TextEditingController();
  // função para cadastro de produto
  _cadastrarprod()async{
   String url = "http://10.109.83.10:3000/produtos"; // url produtos
   Map<String,dynamic> prod={
    "id": nomeprod.text,
    "nome": nomeprod.text,
    "valor": valorprod.text,
    "qtde": qtde.text
   };

   http.post(Uri.parse(url),
   headers: <String,String>{
    'Content-type': 'application/json; charset=UTF-8',
   },
   body: jsonEncode(prod));

   nomeprod.text="";
   valorprod.text="";
   qtde.text="";
  }
  _deleteprod(){
    http.delete(Uri.parse("http://10.109.83.10:3000/produtos/${nomeprod.text}")); // metodo para deletar o produto
    nomeprod.text =""; // limpa o campo com nome do produto
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Mercado"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            hintText: "Digite o nome do produto",),
            controller: nomeprod,
            
          ),
           TextField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            hintText: "Digite o valor do produto",),
            controller: valorprod,            
          ),
           TextField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            hintText: "Digite a quantidade do produto",),
            controller: qtde,
            
          ),
          ElevatedButton(onPressed:  _cadastrarprod, child: Text("Cadastrar")),
          ElevatedButton(onPressed: _deleteprod, child: Text("Deletar"))
          
        ],
      ),
    );
  }
}