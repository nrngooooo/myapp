import 'package:flutter/material.dart';
import 'package:shlglt1/screens/bottomnav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BottomNavScreen(), // Call BottomNavScreen here as the main screen
    );
  }
}
