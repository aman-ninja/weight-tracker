import 'package:sqflite/sqflite.dart';
import 'database_service.dart';
import 'database.dart';

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

  Future<int> create({required String username, required int weight}) async {
    final database = await DatabaseService().database;
    return await database.insert(tableName, {
      'username': username,
      'weight': weight,
      'time': DateTime.now().microsecondsSinceEpoch,
    });
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
  Future<int> update({required int id, required int weight}) async {
    final database = await DatabaseService().database;
    return await database.update(
      tableName,
      {'weight': weight},
      conflictAlgorithm: ConflictAlgorithm.rollback,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
  Future<int> delete({required int id}) async {
    final database = await DatabaseService().database;
    return await database.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
