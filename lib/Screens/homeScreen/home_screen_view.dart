import 'package:flutter/material.dart';
import 'package:weight_tracker/Components/bottom_navigation_bar.dart';

class HomeScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    print('homescreenview $args');
    final String username = args?['username'] ?? '';
    return MaterialApp(
      home: BottomNavigation(username: username),
    );
  }
}
