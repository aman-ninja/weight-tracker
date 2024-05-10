import 'package:flutter/material.dart';
import 'package:weight_tracker/Components/bottom_navigation_bar.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNavigation(),
    );
  }
}
