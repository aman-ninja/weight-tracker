
import 'package:flutter/material.dart';
import 'package:weight_tracker/DataBase/data_db.dart';
import 'package:weight_tracker/Screens/homeScreen/home_screen_view.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final DataDB dataDB = DataDB();

  String username = "";

  Future<void> saveUsername(String username) async {
    try {
      // Call the create method of DataDB to save the username
      await dataDB.createWithUsername(username: username);
      // Navigate to the home screen after successful signup
    } catch (error) {
      // Handle any errors here
      print('Error saving username: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Image.asset(
                'assets/icon/bar-graph.png',
                height: 65,
                width: 63,
              ),
            ),
            Text(
              'Hello',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Welcome to Weight Tracker',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            // AuthForm(
            //   model: model,
            // ),
        Container(
          color: Colors.white,
          child: TextFormField(
            key: ValueKey('username'),
            validator: (value) {
              if (value == null || value.length <= 3 ) {
                return 'Please enter a valid username';
              }
              return null;
            },
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              labelText: 'UserName',
            ),
            onChanged: (value) {
              setState(() {
                username = value;
              });
            },
          ),
        ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async{
                if(await dataDB.doesUsernameExist(username)){
                  warning(context);
                }else{
                  saveUsername(username!);
                  Navigator.pushNamed(
                    context,
                    '/homescreenview',
                    arguments: {'username': username},
                  );
                }
              },
              child: Text('Sign Up'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.red, // background
                backgroundColor: Colors.white, // foreground
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'By tapping SignUp I agree to Terms of service.Privacy Policy and User Agreement. ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      );
  }

  void warning(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Username Already Exists'),
          content: Text('Please choose a different username.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
