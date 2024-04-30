import 'package:aula13_app_correcaoformativa/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    
    // tema do app
    theme: ThemeData(   
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white, // cor primária
    primarySwatch: Colors.red ,),// cor de botões 

  

    
    
    home: Login(),
  ));
}

