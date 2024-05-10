import 'package:flutter/material.dart';
import 'package:weight_tracker/DataBase/data_db.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final DataDB dataDB = DataDB();
  String username = "";
  Future<List<Map<String, dynamic>>>? entries;
  void initState() {
    super.initState();
    fetchEntries();
  }
  void fetchEntries() {
    setState(() {
      entries = dataDB.getAllWeights();
    });
    entries?.then((value) {
      print('Fetched entries sign in: $value');
    });
  }
  Future<bool> doesUserNameExists(String username) async {
    try {
      // Call the DataDB function to check if the username exists
      bool exists = await dataDB.doesUsernameExist(username);
      return exists;
    } catch (error) {
      // Handle any errors here
      print('Error checking username existence: $error');
      return false;
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
              onChanged: (value) {
                username = value;
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              if (await doesUserNameExists(username)) {
                Navigator.pushNamed(context, '/homescreenview', arguments: {'username': username});
              } else {
                warning(context);
              }
            },
            child: Text('Sign In'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.green, // background
              backgroundColor: Colors.white, // foreground
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     'By tapping SignUp I agree to Terms of service.Privacy Policy and User Agreement. ',
          //     textAlign: TextAlign.center,
          //     style: TextStyle(
          //       color: Colors.white,
          //       fontWeight: FontWeight.w500,
          //       fontSize: 13,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
  void warning(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Username Doesn't Exist"),
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
