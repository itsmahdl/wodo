import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wodo/models/task.dart';

class DatabaseHelper {

  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'todo_database.db'),
      onCreate: (db, version) {
        return db.execute(
            "CREATE TABLE tasks(id INTEGER PRIMARY KEY, name TEXT, date TEXT)");
      },
      version: 1,
    );
  }

  Future<void> insertTask(Task task) async {
    Database _db = await database();
    await _db.insert('tasks', task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Task>> getTasks() async {
    Database db = await database();
    List<Map<String, dynamic>> taskMap = await db.query('tasks');
    return List.generate(taskMap.length, (index) {
      return Task(
          id: taskMap[index]['id'],
          name: taskMap[index]['name'],
          date: taskMap[index]['date']);
    });
  }
  Future<int> delete(int id) async {
    final db = await database();
    return await db.delete('tasks', where: "id = ?", whereArgs: [id]);
  }

}
