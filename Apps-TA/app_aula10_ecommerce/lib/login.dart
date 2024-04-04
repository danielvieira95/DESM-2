import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController user = TextEditingController(); // variaveis que irão receber o que digitarmos no campo login
  TextEditingController senha = TextEditingController(); // variaveis que irão receber o que digitarmos no campo senha
  int? op; // Variavel para escolha do app
  String? nome;
  _login(){
    if(user.text =="daniel" && senha.text=="1234" && op ==0){
      print("Login Administrador");
      setState(() {
        nome = "adm";
      });
      

    }
   else if(user.text=="daniel" && senha.text=="1234" && op==1){
      print("Login Cliente");
      setState(() {
        nome = "cliente";
      });
      
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Usuario ou senha invalido'),
        duration: Duration(seconds: 2),
      ),
    );

      }
    
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,// cor do texto
        backgroundColor: Colors.red, // cor do app bar
        title: Text("App Ecommerce"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(30),
                       
                        
                      ),labelStyle: TextStyle(backgroundColor: Colors.white),
                      hintText: "Login",
                      
                      ), 
                      controller: user,                
                      
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      
                    ),labelText: "Digite sua senha"),
                    obscureText: true,
                    obscuringCharacter: "*",
                    controller: senha ,
      
                  ),
                
                 
      
                ],
              ),
      
            ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Admin", style: TextStyle(fontSize: 18),),
                    Radio(value: 0,
                  groupValue: op, 
                  onChanged: (value){
                    setState(() {
                      op= value; 
                    });
                  }),
          Text("Cliente", style: TextStyle(fontSize: 18),),
              Radio(value: 1,
                  groupValue: op, 
                  onChanged: (value){
                    setState(() {
                      op= value; 
                    });
                  }),
                  
                ],
              ),
              ElevatedButton(onPressed: _login, child: Text("Entrar")),
            Text("Radio op $op",style: TextStyle(fontSize: 18),),
            Text("User $nome",style: TextStyle(fontSize: 18),),
            
          ],
        ),
      ) ,
    );
  }
}