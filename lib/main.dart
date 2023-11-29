import 'package:flutter/material.dart';
import 'package:formulario/src/Pages/Bienvenida.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulario App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        hintColor: Colors.blueAccent,
        fontFamily: 'Arial',
      ),
      home: BienvenidaScreen(),
    );
  }
}
