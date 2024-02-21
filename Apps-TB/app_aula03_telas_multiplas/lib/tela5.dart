import 'package:flutter/material.dart';
TextEditingController _user = TextEditingController();
TextEditingController _pass = TextEditingController();
class campotexto extends StatelessWidget {
  const campotexto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Campo texto"),
      ),
      body: Column(
        children: [
          // Text field é o campo texto
          TextField(
            // keyboard type é o tipo de entrada do campo texto
           keyboardType: TextInputType.name,
           decoration: InputDecoration(labelText: "Digite seu nome"), // decoration é uma mensagem no campo texto
           // Tudo que digita aparece no terminal
           /*onChanged: (String texto){
            print(texto);
           }
           */ 
          /*onSubmitted: (String texto){
            print(texto);
            */
            controller: _user,  // controller é um parametro do textfield que armazena o que é digitado
          
          


          ),
          
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Digite a senha"),
            obscureText: true, // comando para esconder a senha digitada
            obscuringCharacter: "*", // comando para substituir o numero digitado por um caractere
            controller: _pass, // armazena o que é digitado no campo texto na variavel _pass
          ),
          ElevatedButton(onPressed: (){
            print(_user.text);
            print(_pass.text);
          }, child: Text("Exibir")),
          ElevatedButton(onPressed: (){
            _user.text = ""; // limpa a variavel user e text é por conta que é string
            _pass.text=  ""; // limpa a variavel user e text é por conta que é string
          }, child: Text("Limpar"))
        ],
      ),
    );
  }
}