import 'package:flutter/material.dart';
import 'package:weight_tracker/Screens/starting_screen.dart';

class ProfileScreen extends StatefulWidget {
  final String username;
  ProfileScreen({Key? key, required this.username}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState(username: username);
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String username;
  _ProfileScreenState({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                username,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cookie',
                ),
              ),
              SizedBox(
                height: 10.0,
                width: 160.0,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
                  child: Text('Sign Out'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.red, // background
                  backgroundColor: Colors.white, // foreground
                ),
              )
            ],
          ),
        ),
    );
  }
}
