import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jewellery_app/ui/category_page/category_page.dart';
import 'package:jewellery_app/ui/home_page/home_page.dart';
import 'package:jewellery_app/ui/profile_page/profile_page.dart';

class Bottom_Bar extends StatefulWidget {
  const Bottom_Bar({Key? key}) : super(key: key);

  @override
  _Bottom_BarState createState() => _Bottom_BarState();
}

class _Bottom_BarState extends State<Bottom_Bar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Home_Page(),
    CategoryPage(),
    Profilepage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined,color: Colors.grey,),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,color: Colors.grey,),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}