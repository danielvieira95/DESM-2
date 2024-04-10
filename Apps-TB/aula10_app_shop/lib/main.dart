import 'package:aula10_app_shop/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    // theme parametro para personalizar as cores do app
    theme: ThemeData(
      primaryColor: Colors.white, // cor primaria do app
      primarySwatch: Colors.red, // cor dos botoes do app
    ),
    home: Login(),
  ));
}

