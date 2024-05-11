import 'package:flutter/material.dart';
import 'package:weight_tracker/Screens/starting_screen.dart'; // Import your starting screen
import 'package:weight_tracker/Routes/routes.dart'; // Import your route configuration file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weight Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Set the initial route to your starting screen
      routes: Routes.getRoute(), // Use the route configuration from your routes file
    );
  }
}
