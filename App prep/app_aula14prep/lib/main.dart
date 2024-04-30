import 'package:flutter/material.dart';


void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Tarefas(),);
  }
}

class Tarefas extends StatefulWidget {
  const Tarefas({super.key});

  @override
  State<Tarefas> createState() => _TarefasState();
}

class _TarefasState extends State<Tarefas> {
  bool st = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de tarefas'),
      
      ),
      

      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(width: 100,height: 100,color: Colors.grey,),
              ),
              Text(
                "Aprender flutter",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          
          Checkbox(value: st, onChanged: (bool? value){
            setState(() {
              st = value !;
            });
            
            

          }),
          Text('Checkbox status: ${st}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey,
                ),
              ),
              Text(
                "Fazer exercicio",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}