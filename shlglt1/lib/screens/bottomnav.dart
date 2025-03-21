import 'package:flutter/material.dart';
import 'package:shlglt1/screens/category.dart';
import 'package:shlglt1/screens/medeelist.dart';
import 'package:shlglt1/screens/saved.dart';
import 'package:shlglt1/screens/searchscreen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  // List of screens
  final List<Widget> _screens = [
    NewsListScreen(), // Discover Screen
    CategoryScreen(), // Category Screen
    SearchScreen(), // Search Screen
    SavedScreen(), // Saved Screen
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      backgroundColor: Colors.grey[100], // Background color for the body
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Discover"),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Category",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Saved"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Handle the tap event
        backgroundColor:
            Colors.white, // Background color for BottomNavigationBar
        selectedItemColor: Colors.blue, // Color of selected item
        unselectedItemColor: Colors.grey, // Color of unselected items
        showUnselectedLabels: true, // Show labels for unselected items
        showSelectedLabels: true, // Show labels for selected items
      ),
    );
  }
}
