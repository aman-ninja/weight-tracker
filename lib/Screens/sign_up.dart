import 'package:flutter/material.dart';
// import 'package:weight_tracker/config/size_config.dart';
// import 'package:weight_tracker/provider/base_view.dart';
// import 'package:weight_tracker/view/auth_screen_view_model.dart';
// import 'components/auth_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
              height: 40,
            ),
            // Container(
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(20.0),
            //   ),
            //   child: Image.asset(
            //     'assets/images/splash_1024.png',
            //     height: 65,
            //     width: 63,
            //   ),
            // ),
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
                  if (value == null || value.length <= 3) {
                    return 'Please enter a valid username';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'UserName',
                ),
                onSaved: (value) {
                  // widget.model.userName = value as String;
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: (){
                // Navigator.pushNamed(context, '/signup');
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
}
