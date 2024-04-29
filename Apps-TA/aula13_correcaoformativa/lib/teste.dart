import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Prod_screen extends StatefulWidget {
  const Prod_screen({super.key});

  @override
  State<Prod_screen> createState() => _Prod_screenState();
}

class _Prod_screenState extends State<Prod_screen> {
  void initState() {
    super.initState();
    leituradados();
  }

  var prod = <Produtos_item>[];
  List dado = [];
  // String url = "http://10.109.83.10:3000/produtos";
  String url = "http://10.109.83.10:3000/produtos";

  Future<void> leituradados() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        dado = jsonDecode(response.body) as List<dynamic>;
        print(dado);
      });

      //prod = dado;
      //  print(prod.length);
      //print(dado);

      //return prod = dado.map((json) => Produtos_item.fromJson(json)).toList();
    } else {
      print(response.statusCode);
      throw Exception('Falha ao consumir api');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de produtos'),
        ),
        body: Center(
          child: ListView.builder(
              itemCount: dado.length,
              itemBuilder: (context, index) {
                final item = dado[index];
                return ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Nome ${item['nome']}',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Valor: ${item['valor']}',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text('Quantidade: ${item['qtde']}',
                          style: TextStyle(fontSize: 18)),
                    ],
                  ),
                );
              }),
        ));
  }
}

class Produtos_item {
  String id;
  String nome;
  String valor;
  String qtde;
  Produtos_item(this.id, this.nome, this.valor, this.qtde);
  factory Produtos_item.fromJson(Map<String, dynamic> json) {
    return Produtos_item(json['id'], json['nome'], json['valor'], json['qtde']);
  }
}

class Produto_lista {
  List prod = [];
  Produto_lista(this.prod);
}