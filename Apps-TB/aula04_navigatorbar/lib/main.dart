import 'package:flutter/material.dart'; // Pacote para o sistema operacional android

// função principal
void main() {
  // Run app é a função que vai chamar a tela do aplicativo
  runApp( NavBottom()); // Material APP é a função necessária para chamar a classe criada
}
// Classe NavBottom do tipo stateless, pois não tem widgets dinamicos
class NavBottom extends StatelessWidget {
  const NavBottom({super.key}); // construtor
 
  @override
  Widget build(BuildContext context) {
    // Scaffold é o layout semipronto do aplicativo
    return MaterialApp(
      home:   // app bar é a barra do aplicativo
                
          NavigatorScreen());
    
  }
}
// Classe do tipo stateful 
class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({super.key});
  
  @override
  // Variavel state que monitora os widgets da classe
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  int selectIndex =0;
  // TextStyle tipo de variavel para receber parametros de acordo com o tipo da fonte do texto
  static const TextStyle optionStyle = TextStyle(fontSize:30,fontWeight: FontWeight.bold);
  // Cria uma lista de widgets para utilizar no navigator bar
  static const List<Widget> _widgetOptions= <Widget> [
    //Text('Index 0 : Home',style:optionStyle ),
    TelaHome(),
    CheckBox(),
    //Text('Index 1: Escola',style:optionStyle ),
    Text('Index 2: Negócio',style: optionStyle,),
    Text('Index 3: Configurações',style:optionStyle),

  ];
  // Funçao que muda o index conforme o icone é pressionado
  void showItemTrap(int index){
    setState(() {
      selectIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    // Widget Scaffold 
    return Scaffold(
      appBar: AppBar(
        title: Text("App Navigator Bar"),
      ),
      // Center centraliza o widget
      body: Center(
        // .elementAt permite passar um numero como index para o widget
        child: _widgetOptions.elementAt(selectIndex),
      ),
      // criar o bottom navigator

       bottomNavigationBar: BottomNavigationBar(
        // itens é cada item do navigation bar
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color.fromARGB(255, 61, 123, 155),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Escola',
            backgroundColor: Color.fromARGB(255, 66, 114, 138),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Negócios',
            backgroundColor: Color.fromARGB(255, 61, 114, 141),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Color.fromARGB(255, 48, 88, 107),
          ),
          ],
           currentIndex: selectIndex,
        selectedItemColor: Colors.yellowAccent,
        onTap:showItemTrap ,
    ));
  }
}

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  String? msg; // declara variavel msg do tipo string
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(color: Colors.blueGrey,width: 250,height: 150,
            child: Text("$msg",style: TextStyle(fontSize: 30),textAlign: TextAlign.center,),),
          ),
          ElevatedButton(onPressed: (){
            setState(() {
              msg= "SENAI";
            });

          }, child: Text("Mensagem")),
          ElevatedButton(onPressed: (){
            setState(() {
              msg= "MOBILE 2";
            });

          }, child: Text("Mensagem 2")),


        ],
      ),
    );
  }
}

class CheckBox extends StatefulWidget {
  const CheckBox({super.key});

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool ischeck = false; // variavel booleana para armazenar o estado do checkbox
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child:            Text("Check Box Widget"),),
          // Checkbox widget
          Checkbox(
          value: ischeck,
          onChanged: (bool? value){
           setState(() {
             ischeck = value!; // ! operador not 
           });
          },
           
          ),
          Text("Checkbox é $ischeck"),

            
          
          
        ],
      ),
    );
  }
}