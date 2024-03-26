import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // biblioteca para requisições http.get
import 'dart:convert'; // biblioteca para conversao de json
void main() {
  runApp(Home());

}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App Pets", // o campo title do Material app é do tipo String
      // Então nao precisa do Text como no Scaffold
      home: PetsScreen(), // classe que constroi a tela do aplicativo
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
    );
  }
}

class PetsScreen extends StatefulWidget {
  const PetsScreen({super.key});

  @override
  State<PetsScreen> createState() => _PetsScreenState();
}

class _PetsScreenState extends State<PetsScreen> {
  // Função do tipo Future que vai receber atualização de dados a partir da api
  Future<List<Pet>> consultaPet() async{
   final response = await http.get(Uri.parse('https://raw.githubusercontent.com/giovannamoeller/pets-api/main/db.json'));
   if(response.statusCode == 200)
   {
        final parsed = jsonDecode(response.body); // realiza o parse do json da api
        List<dynamic> petjson = parsed(['pets']);
        return petjson.map((json)=>Pet.fromJson(json)).toList();
        
   }
   else{
    print(response.statusCode);
    throw Exception("Falha ao consumir api");
   }
   

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Pet"),
      ),
      body: Column(

      ),
    );
  }
}

class Pet{
  // Variaveis para consumir os dados da api
  final String nome; 
  final String imageurl;
  final String idade;
  final String comportamento;
  final String porte;
  final String location;
  final String tel;

  // Criar construtor
  Pet({required this.nome,required this.imageurl, required this.idade,
   required this.comportamento, required this.porte, required this.location, 
   required this.tel} );

   // funçao para separar os dados da api em cada campo da classe
   factory Pet.fromJson(Map<String,dynamic>json){
    return Pet(
      nome: json['name'], 
      imageurl: json['imageUrl'], 
      idade: json['age'],
       comportamento: json['behavior'], 
       porte: json['size'], 
       location: json['location'],
        tel: json['phoneNumber']);
   }

}