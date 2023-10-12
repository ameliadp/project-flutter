import 'package:flutter/material.dart';
import './login.dart';
import './homePage.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigation createState() => _BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigation> {
  int _SelectedTabIndex = 0;
  List<Widget> _pages = [Login(), HomePage()];

  void _onNavBarTapped(int index) {
    setState(() {
      _SelectedTabIndex = index;
    });
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_SelectedTabIndex],
      bottomNavigationBar: Container(
        height: 65,
        child: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 142, 232, 223),
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
          selectedItemColor: Color(0xff3792a1),
          onTap: _onNavBarTapped,
        ),
      ),
    );
  }
}
