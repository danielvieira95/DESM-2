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
 var prodjson ;
  var minhalista;
  var produtos = <Produto>[];
  _consultaapi()async{
    
    http.Response resposta= await http.get(Uri.parse('http://192.168.15.10:3000/produtos'));
   //List<dynamic> dados = json.decode(resposta.body);
  var dados = jsonDecode(resposta.body) as List;
   minhalista = Produtos_n(dados);
  print(minhalista.prod);
  minhalista.prod.forEach((element) {
  prodjson = Produto.fromJson(element); // transforma o elemento em json
    prodjson.id;
  });
  setState(() {
    
    produtos=dados.map((json) => Produto.fromJson(json)).toList();
  });

  
   // print(resposta.body);
    //String url = "localhost:3000/produtos";
   // print(dados);
    /*dados.forEach((element) {
      print(element['nome']);
    });
    */
    
    if(resposta.statusCode==200){

    
      //print(resposta.body);
      
      //Map<String,dynamic> jsonlist= json.decode(resposta.body);
    
       //print(jsonlist);
      // print(jsonlist["produtos"][1]);
       //print(dados[i]);
      //final parsed = jsonDecode(resposta.body);
     // List<dynamic> produtosJson = parsed['produtos'];
     
     //  print(produtosJson[0]);
      // print(produtosJson[1]);
      // print(produtosJson[2]);
      // print(produtosJson[3]);
       //print(produtosJson);
    // return produtosJson.map((json) => Produto.fromJson(json)).toList();
      
      
     
      
     // print(resposta.body);
    
    

   // print(resposta.body);
  }
  }

  publicarPost()async {
  Map<String,dynamic> x={
    "id":"0",
    "nome":"TV",
    "valor": "4500"
  };

  final response = await http.post(
      Uri.parse('http://192.168.15.10:3000/produtos'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(x),
    );

    print("Post");

  }
  delete_item() async {
    String url = "http://192.168.15.10:3000/produtos/1";
    final resp_d = await http.delete(Uri.parse(url));
    print('Item deletado');
  }
  modificar_item() async {
    final resp = await http.put(
      Uri.parse("http://192.168.15.10:3000/produtos/2"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({"id": "3", "nome": "Iphone 15", "valor": "8000"}),
    );
     print('Item alterado');
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
           ElevatedButton(onPressed: delete_item, child: Text("Deletar")),
            ElevatedButton(onPressed: modificar_item, child: Text("Alterar")),
         Column(
          children: [
            Column(
  children: produtos.map((produto) => Text("${produto.nome}- ${produto.valor}", style: TextStyle(fontSize: 18))).toList(),
)
          ],
         )

        ],
        ),
        
    ));
  }
}




class Produto{
  final String id;
  final String nome;
  final String valor;
  
  Produto(this.id, this.nome,this.valor);
  factory Produto.fromJson(Map<String,dynamic>json){
    return Produto(json['id'],json['nome'],json['valor']);
  }

}

class Produtos_n{
  List prod=[];
  Produtos_n(this.prod);
}



class Test{
  String ?nome;
  String? tipo;
  String ?valor;
}