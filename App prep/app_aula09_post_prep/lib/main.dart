import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
 // Dado p = Dado();
  //p.publicarPost("Olá mundo");
 // print(p._getUrl());
 // p.publicarPost();

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Telaprincipal(),
    );
  }
}

class Telaprincipal extends StatefulWidget {
  const Telaprincipal({super.key});

  @override
  State<Telaprincipal> createState() => _TelaprincipalState();
}

class _TelaprincipalState extends State<Telaprincipal> {
   String resource = "learnhttp/";
  String url = "http://10.109.83.10:3000/produtos";
  String url2 = "http://10.109.83.10:3000/categorias";
  _getUrl() async{
  http.Response response= await http.get(Uri.parse("http://10.109.83.10:3000/produtos"));
  //http://10.109.83.10:3000/produtos
  
  print(response.body);


 }
 publicarPost()async {
  Map<String,dynamic> x={
    "Disciplina":"Desenvolvimento Mobile",
    "Curso":"Ads",
    "Escola": "Senai Roberto Mange"
  };

  Map<String, dynamic> r = {
    'nome': 'Hambúrguer de picanha',
    'descricao': 'Pão, bife de hambúrguer 290g de frango, salada e batata.',
    'preco': 9.5,
    'categoria_id': 1,
  };
  final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(r),
    );
    
   
  print("Post");


  // Criando um mapa com a chave "data" e o valor sendo a string "Teste"
  //var data = {"data": "5"};
 
  
}

publicarsobremesa(){
  final response =  http.post(
      Uri.parse(url2),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({"Sobremesa": "Sorvete Kibom"}),
    );
  

}
delete_item() async{
  
  String url = "http://10.109.83.10:3000/produtos/3";
  final resp_d = await  http.delete(Uri.parse(url));
 

}
modificar_item() async{
   final resp = await http.put(
      Uri.parse("http://10.109.83.10:3000/produtos/4"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({"Professor":" Daniel Filipe Vieira"}),

      );
}
  /*
  _publicarpost() async {
    var url = Uri.parse("http://10.109.83.10:3000/");

    var response = await  http.post(
      url,
      body: jsonEncode("Teste"),
    );
    if (response.statusCode == 200) {
      print("Resposta ${response.body}");
    } else {
      print("Falha ao publicar post - Código de status ${response.statusCode}");
    }
  }
  */
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App post http"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: publicarPost, child: Text("Publicar")),
            ElevatedButton(onPressed: delete_item, child: Text("Deletar")),
            ElevatedButton(onPressed: modificar_item, child: Text("Alterar")),
            ElevatedButton(onPressed: publicarsobremesa, child: Text("Sobremesa")),
          ],
        ),
      ),
    );
  }
}

class Dado{
 
}