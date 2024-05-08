import 'package:flutter/material.dart';

class StartingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title : Text('Hello')
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/signin');
                },
                  child: Text('Sign In'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue, // background
                  backgroundColor: Colors.white, // foreground
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text('Sign Up'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.red, // background
                  backgroundColor: Colors.white, // foreground
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
