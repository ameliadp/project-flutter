import 'package:flutter/material.dart';
// import 'homePage.dart';
// import 'login.dart';
import './bottomNavigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigation(),
    );
  }
}