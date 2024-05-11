import 'package:flutter/material.dart';
import 'package:weight_tracker/DataBase/data_db.dart';

class Records extends StatefulWidget {
  final String username;
  Records({required this.username});

  @override
  State<Records> createState() => _EntriesListState(username: username);
}

class _EntriesListState extends State<Records> {
  final String username;
  _EntriesListState({required this.username});
  Future<Map<int, int>>? _entriesFuture;
  final DataDB dataDB = DataDB();
  @override
  void initState() {
    super.initState();
    _fetchEntries();
  }

  void _fetchEntries() {
    _entriesFuture = DataDB().getWeightAndTimeByUsername(widget.username);
  }
  void printEntries() {
    _entriesFuture?.then((Map<int, int> entries) {
      entries.forEach((key, value) {
        print('Key: $key, Value: $value');
      });
    }).catchError((error) {
      print('Error fetching entries: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entries list'),
      ),
      body: FutureBuilder<Map<int, int>>(
        future: _entriesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final entries = snapshot.data!.entries.toList();

            return ListView.builder(
              itemCount: entries.length,
              itemBuilder: (context, index) {
                final entry = entries[index];
                final weight = entry.value;
                final time = entry.key;
                final formattedTime = _formatTime(time); // Format the time

                return ListTile(
                  title: Text('Weight: $weight'),
                  subtitle: Text('Time: $formattedTime'), // Display formatted time
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          _showWeightDialogEdit(context, entry.key);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          DataDB().delete(time: entry.key).then((_) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Entry deleted'),
                            ));
                            setState(() {
                              _fetchEntries();
                            });// Refresh entries after deletion
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No entries found.'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showWeightDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }
  void showWeightDialog() {
    // getUsernameFromArguments();
    int weight=0;
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
                saveEntry(username,weight);
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
  void saveEntry(String username,int weight) {
    dataDB.create(username: username, weight: weight).then((value) {
      setState(() {
        _fetchEntries();
      });
      // Refresh the list of entries
    });
  }

  void _showWeightDialogEdit(BuildContext context, int index) {
    int weight = 0;
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
                weight = int.tryParse(value) ?? 0;
              });
            },
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
                DataDB().update(time: index, weight: weight).then((_) {
                  Navigator.of(context).pop(); // Close the dialog
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Entry updated'),
                  ));
                  setState(() {
                    _fetchEntries();
                  });
                  // Refresh entries after update
                });
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

  String _formatTime(int timestamp) {
    // Convert timestamp to DateTime
    final dateTime = DateTime.fromMicrosecondsSinceEpoch(timestamp);
    // Format DateTime to desired format
    final formattedTime = '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}';
    return formattedTime;
  }
}
