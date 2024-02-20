import 'package:app_aula03_telas_multiplas/tela2.dart';
import 'package:flutter/material.dart'; // pacote de widgets para o android
// função principal do aplicativo
void main() {
  // runAPP função que constroi a tela do app
  // MaterialAPP função do widget para Android
  // home parâmetro inicial para chamar a tela
  runApp(MaterialApp(
    home: Telaprincipal(),
  ));
}

class Telaprincipal extends StatelessWidget {
  const Telaprincipal({super.key});

  @override
  // Constroi a tela do aplicativo
  Widget build(BuildContext context) {
    // Scaffold layout semipronto para criar o aplicativo
    return Scaffold(
      // app bar é a barra do aplicativo
      appBar: AppBar(
       title: Text("Aplicativo aula 03"),
      ),
      // body é o corpo do Scaffold 
      body: // Column coluna do aplicativo
      Column(
        // Children estabelece relação com os demais widgets com a coluna
        mainAxisAlignment: MainAxisAlignment.center, // alinhamento principal do widget column
        children: [
          Container(color: Colors.blue,width: 400,height: 180,
          child: Text("Tela 1",style: TextStyle(fontSize:25 ),),),
          // child é a relação com 1 widgets
          // Navigator.push permite chamar a tela 2 e MaterialPageRoute chama a tela seguinte
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Telasecundaria(),));

          }, child: Text("Tela 2")),
        ],

      ),
    );
  }
}