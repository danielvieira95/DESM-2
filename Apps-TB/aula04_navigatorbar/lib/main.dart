import 'package:flutter/material.dart'; // Pacote para o sistema operacional android

// função principal
void main() {
  // Run app é a função que vai chamar a tela do aplicativo
  runApp(
    // Material APP é a função necessária para chamar a classe criada
    MaterialApp(
    home:NavBottom()));
}
// Classe NavBottom do tipo stateless, pois não tem widgets dinamicos
class NavBottom extends StatelessWidget {
  const NavBottom({super.key}); // construtor
 
  @override
  Widget build(BuildContext context) {
    // Scaffold é o layout semipronto do aplicativo
    return Scaffold(
      // app bar é a barra do aplicativo
      appBar: AppBar(
        // title é o titulo
        // Text - texto do aplicativo
        title:  Text("App Navigator Bar"),
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}