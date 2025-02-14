
import 'package:flutter/material.dart';
import 'screens/carlist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car App',
      home: CarList(),
    );
  }
}
