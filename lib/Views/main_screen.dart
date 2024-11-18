import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'history.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final _screens = [HomeScreen(), HistoryScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'catatan'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'history'),
        ],
      ),
    );
  }
}
