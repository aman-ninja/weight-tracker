import 'package:flutter/material.dart';
import 'package:weight_tracker/Screens/starting_screen.dart';
import 'package:weight_tracker/Routes/routes.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: Routes.getRoute(),
    );
  }
}