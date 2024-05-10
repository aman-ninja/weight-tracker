import 'package:flutter/material.dart';
import 'package:weight_tracker/DataBase/data_db.dart';

class EntriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: DataDB().getAllWeights(), // Fetch all entries from the database
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final entries = snapshot.data!;

          return ListView.builder(
            itemCount: entries.length,
            itemBuilder: (context, index) {
              final entry = entries[index];
              final weight = entry['weight'];
              final time = entry['time'];

              return ListTile(
                title: Text('Weight: $weight'),
                subtitle: Text('Time: $time'),
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
