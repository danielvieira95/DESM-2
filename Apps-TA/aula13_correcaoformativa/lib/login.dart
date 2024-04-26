import 'package:aula13_correcaoformativa/cadastrocliente.dart';
import 'package:aula13_correcaoformativa/cadastroproduto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // pacote para fazer requisições http get, post, delete, put
import 'dart:convert'; // converter arquivo json
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController user = TextEditingController();
  TextEditingController senha = TextEditingController();
  bool exibir = false;
  _verificarlogin() async{

   String url = "http://10.109.83.10:3000/usuarios";
   http.Response resposta = await http.get(Uri.parse(url));
   //var dado = json.decode(resposta.body) as List;
   bool encuser= false;
   List clientes = <Usuario>[];
   clientes = json.decode(resposta.body) ;
   //print(dado);
   print(clientes);
   print("${clientes[0]["login"]} ${clientes[0]["senha"]}");
   for (int i=0; i<clientes.length; i++){
    if(user.text == clientes[i]["login"] && senha.text == clientes[i]["senha"]){
      encuser =true;
      print("Usuario encontrado");
      break;
    }  
    
   }

   if(encuser ==true){
      print("Usuario encontrado");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Cadastroproduto()));
      encuser = false;

    }

    else{
      print("Usuario nao encontrado, realize o cadastro");
        encuser = false;
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("App Mercado"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.name, // define o tipo de entrada do teclado
                      decoration: InputDecoration(border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      icon: Icon(Icons.people_alt_outlined),iconColor: Colors.blue,
                      hintText: "Digite seu nome"
                      
                      ),
                      controller: user,
                      
                        
                        
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.name, // define o tipo de entrada do teclado
                      decoration: InputDecoration(border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      icon: Icon(Icons.key),iconColor: Colors.blue,
                      hintText: "Digite sua senha",
                      suffixIcon: IconButton(icon: Icon(exibir? Icons.visibility:Icons.visibility_off,
                       ),onPressed: (){
                        setState(() {
                          exibir =!exibir;
                        });
                      },
                       
                       ),                  
                      ),
                      obscureText: exibir ,
                      obscuringCharacter: "*",
                      controller: senha,
                      
                        
                        
                    ),
                  ),
      
                ],
              ),
      
            ),
           ElevatedButton(onPressed: _verificarlogin, child: Text("Entrar")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cadastrocliente()));
            }, child: Text("Cadastrar")),
          ],
         
        ),
      ),
    );
  }
}

class Usuario{
  String id;
  String login;
  String senha;
  Usuario(this.id, this.login, this.senha);
  factory Usuario.fromJson(Map<String,dynamic> json){
    return Usuario(json["id"],json["login"],json["senha"]);
  }
}