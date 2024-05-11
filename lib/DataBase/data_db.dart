import 'package:sqflite/sqflite.dart';
import 'database_service.dart';

class DataDB {
  final tableName = 'weights';

  Future<void> createTable(Database database) async {
    await database.execute('''
      CREATE TABLE IF NOT EXISTS $tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL,
        weight INTEGER NOT NULL,
        time INTEGER NOT NULL
      )
    ''');
  }
  Future<bool> doesUsernameExist(String username) async {
    final database = await DatabaseService().database;
    List<Map<String, dynamic>> result = await database.query(
      tableName,
      where: 'username = ?',
      whereArgs: [username],
    );
    return result.isNotEmpty; // Returns true if result is not empty, indicating username exists
  }
  Future<int> create({required String username, required int weight}) async {
    final database = await DatabaseService().database;
    return await database.insert(tableName, {
      'username': username,
      'weight': weight,
      'time': DateTime.now().microsecondsSinceEpoch,
    });
  }
  Future<int> createWithUsername({required String username}) async {
    final database = await DatabaseService().database;
    return await database.insert(tableName, {
      'username': username,
    });
  }
  Future<Map<int, int>> getWeightsByUsername(String username) async {
    final database = await DatabaseService().database;
    final List<Map<String, dynamic>> result = await database.query(
      tableName,
      where: 'username = ?',
      whereArgs: [username],
      orderBy: 'time ASC',
    );

    final Map<int, int> weights = {};
    for (final row in result) {
      weights[row['id'] as int] = row['weight'] as int;
    }

    return weights;
  }
  Future<Map<int, int>> getWeightAndTimeByUsername(String username) async {
    final database = await DatabaseService().database;
    final List<Map<String, dynamic>> result = await database.query(
      tableName,
      columns: ['id', 'weight', 'time'], // Select only id, weight, and time columns
      where: 'username = ?',
      whereArgs: [username],
      orderBy: 'time ASC',
    );

    final Map<int, int> weightAndTime = {};
    for (final row in result) {
      weightAndTime[row['time'] as int] = row['weight'] as int;
    }

    return weightAndTime;
  }

  Future<List<Map<String, dynamic>>> getAllWeights({String? username}) async {
    final database = await DatabaseService().database;
    if (username != null) {
      return await database.query(
        tableName,
        where: 'username = ?',
        whereArgs: [username],
        orderBy: 'time ASC', // Order by time in ascending order
      );
    } else {
      return await database.query(
        tableName,
        orderBy: 'time ASC', // Order by time in ascending order
      );
    }
  }
  Future<Map<String, dynamic>?> fetchById(int id) async {
    final database = await DatabaseService().database;
    List<Map<String, dynamic>> result = await database.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty ? result.first : null;
  }
  Future<int> update({required int time, required int weight}) async {
    final database = await DatabaseService().database;
    final result = await database.update(
      tableName,
      {'weight': weight},
      conflictAlgorithm: ConflictAlgorithm.rollback,
      where: 'time = ?',
      whereArgs: [time],
    );
    print('update check $result');
    return result;
  }
  Future<int> delete({required int time}) async {
    final database = await DatabaseService().database;
    return await database.delete(
      tableName,
      where: 'time = ?',
      whereArgs: [time],
    );
  }
}
