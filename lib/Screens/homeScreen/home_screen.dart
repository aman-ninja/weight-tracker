import 'package:flutter/material.dart';
import 'lineChart.dart';
import 'package:weight_tracker/Components/bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weight Tracker'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LineChartSample2(),
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

  // Method to show the weight entry dialog
  void showWeightDialog() {
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
                // Add your logic to handle weight entry here
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
}
