import 'package:aula13_app_correcaoformativa/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    
    // tema do app
    theme: ThemeData(   
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    primarySwatch: Colors.red

    
    ),
    home: Login(),
  ));
}

