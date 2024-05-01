import 'package:aula13_app_correcaoformativa/cadastrocliente.dart';
import 'package:flutter/material.dart'; // pacotes do widget
import 'package:http/http.dart' as http; // pacote http que permite fazer as requisições http
import 'dart:convert'; // pacote para converter json
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController user = TextEditingController();
  TextEditingController senha = TextEditingController();
  bool exibir = false; // variavel para exibir ou nao a senha
  _verificaLogin()async{
   bool encuser = false; // variavel para setar quando o usuario for encontrado
    String url = "http://10.109.83.10:3000/usuarios"; // url da api com os usuarios
    http.Response resposta = await http.get(Uri.parse(url)); // resposta irá guardar o retorno da api
    List clientes =<Users>[]; // cria uma lista chamada clientes que recebe minha classe users
    print(resposta.statusCode);
    var dados = json.decode(resposta.body) as List; // armazena em dados a minha resposta da api
    clientes = json.decode(resposta.body) as List; // Lista clientes armazena os dados da api
    print("${dados[0]["login"]} ${dados[0]["senha"]}");
    for(int i=0; i<clientes.length;i++){
       if(user.text == clientes[i]["login"] && senha.text == clientes[i]["senha"]){
        encuser = true;
        break;
       }
    }
       if(encuser ==true){
        print("Usuario ${user.text} encontrado");
        encuser = false;
       }
       else{
        print("Usuario ${user.text} nao encontrado");
       }
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
                      suffixIcon: IconButton(icon:  Icon(exibir ? Icons.visibility_off :Icons.visibility),onPressed: (){
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
            ElevatedButton(onPressed: _verificaLogin, child: Text("Entrar"),),
            ElevatedButton(onPressed: (){
              // chama a tela de cadastro
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cadastrousuario()));
            }, child: Text("Cadastrar")),
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