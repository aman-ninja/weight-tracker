import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'lineChart.dart';
import 'package:flutter/material.dart';
import 'package:weight_tracker/DataBase/data_db.dart';
import 'package:weight_tracker/widgets/entry_widget.dart';

  class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  final dataDb = DataDB();
  int weight = 0;
  String username = 'aman';
  Future<List<Map<String, dynamic>>>? entries;
  @override
  void initState(){
    super.initState();
    fetchEntries();
  }

  void fetchEntries() {
    setState(() {
      entries = dataDb.getAllWeights();
    });
    entries?.then((value) {
      print('Fetched entries: $value');
    });
  }
  Widget build(BuildContext conqtext) {
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
            onChanged: (value) {
              setState(() {
                weight = int.tryParse(value)!;
                // time = DateFormat.yMd().add_jm().format(dateTime);
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
