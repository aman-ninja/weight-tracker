import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'lineChart.dart';
import 'package:flutter/material.dart';
import 'package:weight_tracker/DataBase/data_db.dart';
import 'package:weight_tracker/Screens/records_screen.dart';

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
    // fetchEntries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Weight Tracker'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LineChartSample2(username: username,),
              SizedBox(height: 10,),
              Text(
                'Line Chart to Track Monthly Progress',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
    );
  }
  void fetchEntries() {
    setState(() {
      entries = dataDb.getAllWeights();
    });
  }
}
