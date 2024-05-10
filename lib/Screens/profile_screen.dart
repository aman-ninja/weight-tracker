import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>  [
              // CircleAvatar(
              //   backgroundImage: AssetImage('images/aman.jpg'),
              //   radius: 70,
              // ),
              Text('Aman khan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cookie',
                ),
              ),
              Text('FLUTTER DEVELOPER',
                style: TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'Dosis',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10.0,
                width: 160.0,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 18.0,vertical: 10.0),

                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.teal,
                    ),
                    title: Text('   +91 89204 82898',
                        style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        )
                    ),
                  )
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 18.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '8742909496aman@gmail.com',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                    ),

                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
