import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App Pets",
     theme: ThemeData(
      primarySwatch: Colors.blueGrey,
     ),
     home: PetsScreen(),

     );
    
  }
}
class PetsScreen extends StatefulWidget {
  const PetsScreen({super.key});

  @override
  State<PetsScreen> createState() => _PetsScreenState();
}

class _PetsScreenState extends State<PetsScreen> {
  Future<List<Pet>> consultaPet() async{
    final response = await http.get(Uri.parse('https://raw.githubusercontent.com/giovannamoeller/pets-api/main/db.json'));
    if(response.statusCode ==200){
      final parsed = jsonDecode(response.body);
      List<dynamic> petJson = parsed['pets'];
      return petJson.map((json)=> Pet.fromJson(json)).toList(); // método para converter o json em forma de lista
    }
    else{
      print(response.statusCode);
      throw Exception('Falha ao consumir a api');
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Pet adote"),
      ),
      body: Center(

      ),
    );
  }
}