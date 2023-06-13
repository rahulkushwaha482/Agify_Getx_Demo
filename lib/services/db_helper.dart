import 'package:agify_getx_demo/model/post_response.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Future<Database> database() async {
    var dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'post.db'),
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE post(id INTEGER PRIMARY KEY, title TEXT,body TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertDB(PostResponse data) async {
    final db = await DBHelper.database();
    await db.insert('post', data.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<PostResponse>?> getItems() async {
    final db = await DBHelper.database();
    final List<Map<String, Object?>> queryResult = await db.query('post');
    return queryResult.map((e) => PostResponse.fromJson(e)).toList();
  }
}
