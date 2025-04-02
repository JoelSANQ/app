import 'package:app/data/add_date.dart';
import 'package:flutter/material.dart';
import 'package:app/widget/Bottom.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(AdddataAdapter());
  await Hive.openBox<Add_data>('data');
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bottom(),
    );
  }
  
}