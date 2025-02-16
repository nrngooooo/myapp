import 'package:flutter/material.dart';
import 'package:phchulabfe/screens/carlist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CarListScreen(),
    );
  }
}
