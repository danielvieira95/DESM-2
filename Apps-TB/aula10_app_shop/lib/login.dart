import 'package:aula10_app_shop/cliente.dart';
import 'package:aula10_app_shop/produto.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController user = TextEditingController(); // armazena o que é digitado no campo texto
  TextEditingController senha = TextEditingController(); // armazena o que é digitado no campo texto
  int? selectop ;
  _verificarlogin(){
    if(user.text=="daniel" && senha.text=="100455" && selectop ==0 ){
      print("Administrador");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Cadastroproduto()));

    }
    if(user.text =="daniel" && senha.text =="100455" && selectop ==1){
      print("Cliente");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Cliente()));
    }
    else{
      // Scaffold Messenger
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content:Text("Usuario ou senha inválido"),duration: Duration(seconds: 2) ),
        

      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Shop"),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200, // largura
              height: 200, // altura do size box
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0), // padding para ajustar o espaço entre os elementos
                    child: TextField(
                      keyboardType: TextInputType.name, // text field para o login
                      decoration: InputDecoration(border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(30) // borda do TextField
                      ),labelStyle: TextStyle(backgroundColor:Colors.white ),
                      hintText: "Insira seu login"),
                      controller: user ,
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.number, // text field para a senha
                    decoration: InputDecoration(border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(30) // borda do TextField
                    ),labelStyle: TextStyle(backgroundColor:Colors.white ),
                    hintText: "Insira sua senha"),
                    controller: senha ,
                    obscureText: true, // parametro para esconder a senha
                    obscuringCharacter: "*", // parametro para escolher o tipo de caracter para esconder a senha
                  ),
      
                ],
              ),
      
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Admin",style: TextStyle(fontSize: 18),),
                Radio(
                  value: 0, // valor quando eu clico no Radio Button 
                groupValue: selectop, // variavel criada para armazenar o estado do Radio Button
                onChanged: (value){
                  setState(() {
                    selectop = value;
                  });
                
                }),
                Text("Cliente",style: TextStyle(fontSize: 18),),
                Radio(
              value: 1, 
              groupValue: selectop,
               onChanged: (value){
                setState(() {
                  selectop = value;
                });
                

               })
              ],
            ),
            ElevatedButton(onPressed: _verificarlogin, child: Text("Entrar")),
          ],
      
        ),
      ),
    );
  }
}