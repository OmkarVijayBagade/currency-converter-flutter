import 'package:flutter/material.dart';
import 'package:learn/currency_converter.dart';

void main() {
  runApp(const MainApp());
}
//1. create variable to store the converted amount 
//2. create function to handle conversion logic given by the textfield input
//3. store the value in the variable 
//4. display the value in the text widget

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CurrencyConverter(),
    ); 
  }
 
}
