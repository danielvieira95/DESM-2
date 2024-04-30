import 'package:flutter/material.dart'; // pacotes do widget
import 'package:http/http.dart' as http; // pacote http que permite fazer as requisições http
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController user = TextEditingController();
  TextEditingController senha = TextEditingController();
  bool exibir = false; // variavel para exibir ou nao a senha
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
                      controller: user,
                     
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
                      
                      controller: senha,
                     
                    ),
                  ),
                ],
              ),
      
            ),
            ElevatedButton(onPressed: (){}, child: Text("Entrar"),),
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