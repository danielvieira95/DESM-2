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
      
   /*Text(
      'Index 0: School',
      style: optionStyle,
    ), */
   // Tela1() ,  
   TelaHome(),
    /*Text(
      'Index 1: Business',
      style: optionStyle,
    ),*/
    CheckboxExample(),
    RadioButton(),
    /*Text(
      'Index 2: School',
      style: optionStyle,
    ),
    */
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
      ),
    
        
          
          

    );
  }
}

class TelaHome extends StatelessWidget {
  const TelaHome({super.key});
 static const TextStyle styletext =  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Center(child: Text("Mobile 2",style: styletext)),
        ],
      ),
    );
  }
}

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => CheckBoxState();
}

class CheckBoxState extends State<CheckboxExample> {
   // variavel para armazenar o valor do check box
   
   bool ischeck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Check Box 1"),
          Checkbox(
            // Value é o parametro do check box
            // ischeck variavel booleana que recebe o parametro value do check box
          value:  ischeck, 
          onChanged:(bool? value){
            setState(() {
              ischeck = value!;
              
            });
          }
          
          
          
           ),
            Text("Status do checkbox $ischeck"),
        ],
      ),
    );
  }
}

class RadioButton extends StatefulWidget {
  const RadioButton({super.key});

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  int ? selectOption;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RadioListTile<int>(
          title: Text("Opção 1"),
          value: 1,
          groupValue: selectOption,
          onChanged: (value){
            setState(() {
              selectOption = value;
              
            });
          },

        ),
        RadioListTile<int>(
          title: Text("Opção 2"),
          value: 2,
          groupValue: selectOption,
          onChanged: (value){
            setState(() {
              selectOption = value;
              
            });
          },

        ),
        RadioListTile(
          title: Text("Opção 3"),
          value: 3,
          groupValue: selectOption,
          onChanged: (value){
            setState(() {
              selectOption = value;
              
            });
          },

        ),
        Text("Radio button opção $selectOption"),

      ],
    );
  }
}