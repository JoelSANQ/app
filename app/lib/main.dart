import 'package:flutter/material.dart';
import 'package:app/Screens/stadistics.dart';
import 'package:app/Screens/home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stadistics(),
    );
  }
  
}