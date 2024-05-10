import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:weight_tracker/DataBase/data_db.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:weight_tracker/DataBase/data_db.dart';

class LineChartSample2 extends StatefulWidget {
  final String username;
  LineChartSample2({Key? key, required this.username}) : super(key: key);

  @override
  _LineChartSample2State createState() => _LineChartSample2State(username: username);
}

class _LineChartSample2State extends State<LineChartSample2> {
  final String username;
  final dataDb = DataDB();
  late Future<Map<int, int>> entries;

  _LineChartSample2State({Key? key, required this.username});

  void initState() {
    super.initState();
    fetchEntries();
  }

  void fetchEntries() {
    setState(() {
      entries = dataDb.getWeightsByUsername(username);
    });
  }

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<int, int>>(
      future: entries,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Display a loading indicator while fetching data
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}'); // Display an error message if fetching fails
        } else {
          final Map<int, int> data = snapshot.data ?? {}; // Extract the fetched data
          return Stack(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1.70,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      ),
                      color: Theme.of(context).primaryColor),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 18.0, left: 12.0, top: 24, bottom: 12),
                    child: LineChart(
                      mainData(data),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 60,
                height: 34,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'avg',
                    style: TextStyle(
                        fontSize: 12,
                        color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  LineChartData mainData(Map<int, int> data) {
    final List<FlSpot> spots = data.entries.map((entry) => FlSpot(entry.key.toDouble(), entry.value.toDouble())).toList();

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.white,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.white,
            strokeWidth: 1,
          );
        },
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(
            color: Colors.white,
            width: 2,
          )),
      minX: 0,
      maxX: data.isNotEmpty ? data.keys.reduce((a, b) => a > b ? a : b).toDouble() : 11,
      minY: 0,
      maxY: data.isNotEmpty ? data.values.reduce((a, b) => a > b ? a : b).toDouble() : 6,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          color: gradientColors.first,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            color: gradientColors.last,
          ),
        ),
      ],
    );
  }
}
