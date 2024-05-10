import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'lineChart.dart';
import 'package:flutter/material.dart';
import 'package:weight_tracker/DataBase/data_db.dart';
import 'package:weight_tracker/widgets/entry_widget.dart';

  class HomeScreen extends StatefulWidget {
    final String username;
  const HomeScreen({required this.username});
  @override
  State<HomeScreen> createState() => _HomeScreenState(username);
}
class _HomeScreenState extends State<HomeScreen> {
  final dataDb = DataDB();
  int weight = 0;
  final String username;
  Future<List<Map<String, dynamic>>>? entries;
  _HomeScreenState(this.username);

  @override
  void initState() {
    super.initState();
    fetchEntries();
  }

  @override
  Widget build(BuildContext context) {
    // Move this call to build method
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weight Tracker'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LineChartSample2(username: username,),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: showWeightDialog, // Call showWeightDialog when button is pressed
                child: Text('Add Weight'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, // background
                  backgroundColor: Colors.blue, // foreground
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void getUsernameFromArguments() {
  //   final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
  //   print('argumengt kr le $args');
  //   // Check if args is not null before accessing its values
  //   if (args != null && args.containsKey('username')) {
  //     username = args['username'];
  //   } else {
  //     // Handle the case where username is not provided in route arguments
  //     // You can assign a default value or handle it differently based on your app logic
  //   }
  // }


  void fetchEntries() {
    setState(() {
      entries = dataDb.getAllWeights();
    });
    entries?.then((value) {
      print('Fetched entries: $value');
    });
  }

  void showWeightDialog() {
    // getUsernameFromArguments();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Weight'),
          content: TextField(
              decoration: InputDecoration(
                hintText: 'Enter your weight',
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                setState(() {
                  weight = int.tryParse(value)!;
                });
              }
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                saveEntry();
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Save'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // background color
              ),
            ),
          ],
        );
      },
    );
  }

  void saveEntry() {
    dataDb.create(username: username, weight: weight).then((value) {
      fetchEntries(); // Refresh the list of entries
    });
  }
}
