import 'package:flutter/material.dart';

void main() {
  runApp(NavBotton());
}

class NavBotton extends StatelessWidget {
  const NavBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Navigator_screen(),
    );
  }
}

class Navigator_screen extends StatefulWidget {
  const Navigator_screen({super.key});

  @override
  State<Navigator_screen> createState() => _Navigator_screenState();

}

class _Navigator_screenState extends State<Navigator_screen> {
  int selectIndex =0; // variavel pela escolha do widget bar
  // Constante para definir caracteristicas do texto
  static const TextStyle optionStyle =  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // Cria lista de widgets 
  static const List<Widget> _widgetOptions = <Widget>[   
      
   Text(
      'Index 0: School',
      style: optionStyle,
    ), 
   // Tela1() ,  
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
  
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
    
    
  ];
  void onItemTapped(int index) {
    setState(() {
      selectIndex = index;
      
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplicativo aula 04"),
      ),
      body:  Center(
        child: _widgetOptions.elementAt(selectIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.purple,
          ),
        ],
        currentIndex: selectIndex,
        selectedItemColor: Colors.white,
        onTap: onItemTapped,
      );
    
        
          
          

    );
  }
}