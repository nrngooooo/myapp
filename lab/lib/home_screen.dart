import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text('🏠 Home Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('🔍 Search Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('👤 Profile Page', style: TextStyle(fontSize: 24))),
  ];

  final List<Color> _backgroundColors = [
    Colors.blue.shade100, // Home Page Background
    Colors.green.shade100, // Search Page Background
    Colors.purple.shade100, // Profile Page Background
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Salomon Bottom Bar Example')),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        color: _backgroundColors[_selectedIndex],
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: Colors.blue,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.search),
            title: const Text("Search"),
            selectedColor: Colors.green,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Profile"),
            selectedColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}
