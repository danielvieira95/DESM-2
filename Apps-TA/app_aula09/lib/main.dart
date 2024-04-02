import 'package:app_aula09/login.dart';
//import 'package:app_aula09/tela2.dart';
//import 'package:app_aula09/tela3.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
        
        theme: ThemeData(
        primaryColor: Colors.white,
        
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.red[900],
          ),
        ),
        textSelectionTheme:
            TextSelectionThemeData(cursorColor: Colors.redAccent),
      ),
    home: Login(),
    
    
  ));
}

