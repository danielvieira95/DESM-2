import 'package:flutter/material.dart'; // pacotes do widget
import 'package:http/http.dart' as http; // pacote http que permite fazer as requisições http
import 'dart:convert'; // pacote para converter json
class Cadastrousuario extends StatefulWidget {
  

  @override
  State<Cadastrousuario> createState() => _CadastrousuarioState();
}

class _CadastrousuarioState extends State<Cadastrousuario> {
  TextEditingController user_n = TextEditingController();
  TextEditingController senha_n = TextEditingController();
  bool exibir = false; // variavel para exibir ou nao a senha
  _cadastrausuario()async{
   bool encuser = false; // variavel para setar quando o usuario for encontrado
    String url = "http://10.109.83.10:3000/usuarios";
    Map<String,dynamic> mensagem = {
      "id": user_n.text,
      "login":user_n.text,
      "senha": senha_n.text,

    };
    // http post metodo para realizar um post na api
    http.post(Uri.parse(url),
    headers: <String,String> {
      'Content-type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(mensagem)  );
    
     // url da api com os usuarios
    print("Usuario cadastrado");
    user_n.text =""; // limpa os campos
    senha_n.text =""; // limpa os campos 
    

    
    }
    
  
  @override
  Widget build(BuildContext context) {
    // Scaffold faz parte do layout do app
    return Scaffold(
      // body corpo do scaffold
      //backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // elemento decorativo
            SizedBox(
              height:300 ,
              width: 300,
              child: Column(
                children: [
                  // textformfield para permitir que o usuário digite seu nome
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      icon: Icon(Icons.people_alt_outlined,color: Colors.red,),
                      hintText: "Digite seu nome"),// Mensagem no text form field
                      // icone do textformfield
                      controller: user_n,
                     
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      icon: Icon(Icons.key_outlined,),iconColor: Colors.red,
                      // suffix icon responsável por criar um icone no textformfield
                      // Icon button icone para o botão 
                      // exibir ? operador ternário
                      // if( exibir == true icons.visibility  else visibility off)
                      suffixIcon: IconButton(icon:  Icon(exibir ? Icons.visibility :Icons.visibility_off),onPressed: (){
                        setState(() {
                          exibir = !exibir; // inverte o estado da variavel exibir
                        });
                      }),
                      hintText: "Digite sua senha"),
                      obscureText: exibir,
                      obscuringCharacter: '*',// Mensagem no text form field
                      // icone do textformfield
                      
                      controller: senha_n,
                     
                    ),
                  ),
                ],
              ),
      
            ),
            ElevatedButton(onPressed: _cadastrausuario, child: Text("Entrar"),),
            ElevatedButton(onPressed: (){}, child: Text("Cadastrar")),
          ],
        ),
      ),
    );
  }
}

// Classe para realizar o mapeamento json através da api
class Users{
  String id;
  String login;
  String senha;
  Users(this.id,this.login, this.senha);
  // Função para mapear nossos dados após a leitura da api e
  // retorna id, login  e senha
  factory Users.fromJson(Map<String,dynamic>json){
    return Users(json["id"],json["login"],json["senha"]);
  }
}