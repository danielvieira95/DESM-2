import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // metodo que permite interação com api
import 'dart:convert'; // metodo que permite conversão de dado

void main() {
  runApp(MaterialApp(
    home: Telaprincipal(),
  ));
}

class Telaprincipal extends StatefulWidget {
  const Telaprincipal({super.key});

  @override
  State<Telaprincipal> createState() => _TelaprincipalState();
}

class _TelaprincipalState extends State<Telaprincipal> {
  String url = "http://192.168.56.1:3000/produtos";
  var minhalista;
  var produtos = <Produto>[]; // variavel produtos incorpora a classe Produto e inicia vazia
  _getdado()async{
    
   http.Response resposta=  await http.get(Uri.parse(url)); // async e await sao porque a comunicação é assincrona
    //Map<String,dynamic> dado = json.decode(resposta.body); // pega apenas um elemento e mapeia como string
   var dado = jsonDecode(resposta.body) as List;// converte todos os elementos da api para uma lista
   //print(resposta.body);
   /*for(int i=0; i<dado.length;i++){
    print("${dado[i]["nome"]} ${dado[i]["valor"]}");
   
   }*/

   setState(() {
    produtos = dado.map((json) => Produto.fromJson(json)).toList(); // transforma o produto em uma lista para exibir no app
     
   });
   
   minhalista = Produto_n(dado); 
   print(minhalista.prod);
   // forEach exibe elemento por elemento da lista
  /*
  minhalista.prod.forEach((element) {
   print(element); // transforma o elemento em json
    
  });
  */
  // print(minhalista.prod[0]);
  }

  _post(){
   // estrutura do arquivo json para realizar o post
    Map<String, dynamic> produto_a= {
     "id":"8",
     "nome":"PS5",
     "valor":"5000"
    };
    Map<String,dynamic> mensagem={
      "title": "Desenvolvimento Mobile 2",
      "Escola": "Senai Roberto Mange"
    };
    // variavel response vai armazenar a resposta do http post
    // http post (Uri.parse(url), headers, body - conteudo do post)
    http.post(
    Uri.parse(url),
    headers: <String,String>{
      'Content-type':'application/json; charset=UTF-8',
    },
    body: jsonEncode(produto_a),
    //body: jsonEncode(mensagem), // jsonEncode formata a mensagem no formato json para envio
   );
   print("Post: ${produto_a}");
   //print(response.statusCode);
  }
  // função para deletar um item da api
  _deletepost(){
    http.delete(Uri.parse('http://192.168.56.1:3000/produtos/8'));
    print("Item deletado");
  }
  // put só irá funcionar com um dado que já estiver postado na api
  _modificarpost(){
    http.put(Uri.parse('http://192.168.56.1:3000/produtos/8'),
    headers: <String,String>{
      'Content-type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({"id":"4","nome":"Nintendo Switch","valor":"2800" }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( "App post http"),
      ),
      body: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          
          children: [
            Text(" Consumo de API ",style: TextStyle(fontSize: 18),),
            ElevatedButton(onPressed:_getdado, child: Text("Ler")),
            ElevatedButton(onPressed: _post, child: Text("Enviar")),
            ElevatedButton(onPressed: _deletepost, child: Text("Deletar")),
            ElevatedButton(onPressed: _modificarpost, child: Text("Alterar")),
            Column(
  children: produtos.map((produto) => Text("${produto.nome}- ${produto.valor}", style: TextStyle(fontSize: 18))).toList(),
)
           
          ],
        ),
      ),
    );
  }
}

class Produto{
  final String id;
  final String nome;
  final String valor;
  Produto(this.id, this.nome, this.valor);
  // factory será responsável por mapear o nosso json na classe produto
  factory Produto.fromJson(Map<String,dynamic>json){
   return Produto(
    json['id'],json['nome'],json['valor']);
  }
}

class Produto_n{
  List prod=[]; // criando uma lista chamada prod para a classe produto_n
  Produto_n(this.prod); // construtor da classe produto_n
}