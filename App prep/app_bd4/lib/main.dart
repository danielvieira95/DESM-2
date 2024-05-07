import 'package:app_bd4/database/userdao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Users daniel = Users('Daniel', '28');
  Map<String,dynamic> Daniel ={
    'name':'Daniel',
    'idade': '28'
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'App BD 2'
        )
      ),
      body: Column(
        children: [
          Text('Banco de dados'),
          ElevatedButton(onPressed: (){
            WidgetsFlutterBinding.ensureInitialized();
            UsersDao().salvar(Users("Daniel", "28"));
           

          }, child: Text('Salvar')),
          ElevatedButton(onPressed: (){
            UsersDao().findAll();

          }, child: Text('Exibir'))
        ],
      ),
    );
  }
}