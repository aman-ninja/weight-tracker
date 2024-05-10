import 'package:flutter/material.dart';
import 'package:weight_tracker/DataBase/data_db.dart';
import 'package:flutter/material.dart';
import 'package:weight_tracker/DataBase/data_db.dart';

class EntriesList extends StatelessWidget {
  final String username;
  EntriesList({required this.username});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<int, int>>(
      future: DataDB().getWeightsByUsername(username), // Fetch all entries from the database
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
              return ListTile(
                title: Text('Weight: $weight'),
                subtitle: Text('time: $time'),
              );
            },
          );
        } else {
          return Center(child: Text('No entries found.'));
        }
      },
    );
  }
}