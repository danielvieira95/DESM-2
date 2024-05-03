import 'package:app_aula14bd/data/userdao.dart';
import 'package:flutter/material.dart';

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
  TextEditingController nome = TextEditingController();
  TextEditingController idade = TextEditingController();
  TextEditingController hobbie = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     appBar: AppBar(
      title: Text("App BD"),
     ),
     body: Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.name,
          controller: nome,
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          controller: idade,
        ),
        TextFormField(
          keyboardType: TextInputType.name,
          controller: hobbie,
        ),
        ElevatedButton(onPressed: (){
          print('Dados: ${nome.text}, ${idade.text}, ${hobbie.text}');
          
          UserDao().salvar(Users('0', nome.text, idade.text, hobbie.text));

        }, child: Text('Salvar')),
        ElevatedButton(onPressed: (){
          UserDao().listaruser();

        }, child: Text('Exibir')),
      ],
     ),
    );
  }
}