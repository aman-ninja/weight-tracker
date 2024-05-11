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
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Image.asset(
              'assets/icon/bar-graph.png',
              height: 65,
              width: 63,
            ),
          ),
          Text(
            'User Profile',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 8,
              ),
              Text(
                'Account',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                username,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cookie',
                ),
              ),
              SizedBox(
                height: 10.0,
                width: 160.0,
                child: Divider(
                  color: Colors.black,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
                child: Text('Sign Out'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, // background
                  backgroundColor: Colors.red, // foreground
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}