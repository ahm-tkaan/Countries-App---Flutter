import 'package:flutter/material.dart';
import 'package:ulkeler/MainPage.dart';


void main(){
  runApp(MainApp());
  
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}
