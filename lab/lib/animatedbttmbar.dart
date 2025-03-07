import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

class AnimatedBottomBarScreen extends StatefulWidget {
  const AnimatedBottomBarScreen({super.key});

  @override
  _AnimatedBottomBarScreenState createState() =>
      _AnimatedBottomBarScreenState();
}

class _AnimatedBottomBarScreenState extends State<AnimatedBottomBarScreen> {
  int _selectedIndex = 0;
  Color _backgroundColor = Colors.white; // Default background color

  final List<Widget> _pages = [
    Center(child: Text('🏠 Home Хуудас', style: TextStyle(fontSize: 24))),
    Center(child: Text('🔍 Search Хуудас', style: TextStyle(fontSize: 24))),
    Center(child: Text('👤 Profile Хуудас', style: TextStyle(fontSize: 24))),
  ];

  final _controller = NotchBottomBarController(index: 0);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Update background color based on selected index
      if (index == 0) {
        _backgroundColor = Colors.lightBlue; // Home - Default color
      } else if (index == 1) {
        _backgroundColor = Colors.lightGreenAccent; // Search - Light Blue
      } else if (index == 2) {
        _backgroundColor = const Color.fromARGB(
          255,
          224,
          128,
          128,
        ); // Profile - Light Green
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Notch Bottom Bar')),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: Container(
          key: ValueKey<int>(_selectedIndex), // To trigger animation
          color: _backgroundColor, // Use the updated background color
          child: _pages[_selectedIndex],
        ),
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        color: const Color.fromARGB(255, 204, 215, 233),
        showLabel: true,
        notchColor: Colors.white,
        kIconSize: 24.0,
        kBottomRadius: 20.0,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: Icon(Icons.home_outlined, color: Colors.grey),
            activeItem: Icon(Icons.home, color: Colors.blue),
            itemLabel: 'Home',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.search_outlined, color: Colors.grey),
            activeItem: Icon(Icons.search, color: Colors.green),
            itemLabel: 'Search',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.person_outline, color: Colors.grey),
            activeItem: Icon(Icons.person, color: Colors.red),
            itemLabel: 'Profile',
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
