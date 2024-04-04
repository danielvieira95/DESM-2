import 'package:app_aula10_ecommerce/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.white,// cor primaria do app texto
      primarySwatch: Colors.red, // cor do button fundo 
    ),
    home: Login(),
  ));
}

