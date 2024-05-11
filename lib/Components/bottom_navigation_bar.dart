import 'package:flutter/material.dart';
import 'package:weight_tracker/Screens/homeScreen/home_screen.dart';
import 'package:weight_tracker/Screens/profile_screen.dart';
import 'package:weight_tracker/Screens/records_screen.dart';
import 'package:weight_tracker/widgets/entry_widget.dart';

class BottomNavigation extends StatefulWidget {
  final String username;
  BottomNavigation({Key? key, required this.username}) : super(key: key);
  @override
  _BottomNavigationState createState() => _BottomNavigationState(username: username);
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  final String username ;
  _BottomNavigationState({Key? key,required this.username});
  // Define screens
  late final List<Widget> _screens = [
    HomeScreen(username: username),
    EntriesList(username: username,),
    ProfileScreen(username : username),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Records',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}