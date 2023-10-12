import 'package:flutter/material.dart';
import 'homePage.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class BottomNavigation extends StatefulWidget{
  const BottomNavigation({Key? key}) : super(key: key);

  @override
_BottomNavigation createState() => _BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigation>{
  int _SelectedTabIndex = 0;
  List<Widget> _pages = [Login(), HomePage()];

  void _onNavBarTapped(int index){
    setState(() {
      _SelectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_SelectedTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
        ],
        currentIndex: _SelectedTabIndex,
        selectedItemColor: Color(0xff73ebdc),
        onTap: _onNavBarTapped,
      ),
    );
  } 
}