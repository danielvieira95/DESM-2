import 'package:app_bd3/database/user_Dao.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nome = TextEditingController();
  TextEditingController idade = TextEditingController();
  TextEditingController hobbie = TextEditingController();
  List<Users> usuarios = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App bd'),
        ),
        body: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.name,
              controller: nome,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: idade,
              decoration: InputDecoration(labelText: 'Idade'),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: hobbie,
              decoration: InputDecoration(labelText: 'Hobbie'),
            ),
            ElevatedButton(
              onPressed: () async {
                await UsersDao().salvar(
                  Users('0', nome.text, idade.text, hobbie.text),
                );
                // Atualiza a lista de usuários após salvar
                await _atualizarListaUsuarios();
              },
              child: Text('Salvar'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Lista os usuários e atualiza a lista
                await _atualizarListaUsuarios();
              },
              child: Text('Exibir'),
            ),
            // Exibe a lista de usuários
            Expanded(
              child: ListView.builder(
                itemCount: usuarios.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(usuarios[index].nome),
                    subtitle: Text(usuarios[index].idade),
                    trailing: Text(usuarios[index].hobbie),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para atualizar a lista de usuários
  Future<void> _atualizarListaUsuarios() async {
    List<Users> lista = await UsersDao().listaruser();
    setState(() {
      usuarios = lista;
    });
  }
}
