// import 'dart:html';
//
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// import '../models/post.dart';
// import '../models/user.dart';
// import '../models/comment.dart';
//
// class DatabaseManager {
//   Database? _database;
//
//   Future<Database> get database async {
//     if (_database != null) {
//       return _database!;
//     }
//
//     _database = await initDatabase();
//     return _database!;
//   }
//
//   Future<Database> initDatabase() async {
//     return openDatabase(
//       join(await getDatabasesPath(), 'your_database.db'),
//       onCreate: (db, version) {
//         db.execute(
//           "CREATE TABLE posts(id INTEGER PRIMARY KEY, userId INTEGER, title TEXT, body TEXT)",
//         );
//         db.execute(
//           "CREATE TABLE comments(id INTEGER PRIMARY KEY, postId INTEGER, name TEXT, email TEXT, body TEXT)",
//         );
//         db.execute(
//           "CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, username TEXT, email TEXT, phone TEXT)",
//         );
//       },
//       version: 1,
//     );
//   }
//
//   Future<void> cachePosts(List<Post> posts) async {
//     final db = await database;
//     for (var post in posts) {
//       await db.insert('posts', post.toMap());
//     }
//   }
//
//   Future<List<Post>> getCachedPosts() async {
//     final db = await database;
//     final List<Map<String, dynamic>> maps = await db.query('posts');
//     return List.generate(maps.length, (i) {
//       return Post(
//         id: maps[i]['id'],
//         userId: maps[i]['userId'],
//         title: maps[i]['title'],
//         body: maps[i]['body'],
//       );
//     });
//   }
//
//   Future<void> cacheComments(List<Comment> comments) async {
//     final db = await database;
//     for (var comment in comments) {
//       await db.insert('comments', comment.toMap());
//     }
//   }
//
//   Future<List<Comment>> getCachedComments() async {
//     final db = await database;
//     final List<Map<String, dynamic>> maps = await db.query('comments');
//     return List.generate(maps.length, (i) {
//       return Comment(
//         id: maps[i]['id'],
//         postId: maps[i]['postId'],
//         name: maps[i]['name'],
//         email: maps[i]['email'],
//         body: maps[i]['body'],
//       );
//     });
//   }
//
//   Future<void> cacheUsers(List<User> users) async {
//     final db = await database;
//     for (var user in users) {
//       await db.insert('users', user.toMap());
//     }
//   }
//
//   Future<List<User>> getCachedUsers() async {
//     final db = await database;
//     final List<Map<String, dynamic>> maps = await db.query('users');
//     return List.generate(maps.length, (i) {
//       return User(
//         id: maps[i]['id'],
//         name: maps[i]['name'],
//            );
//     });
//   }
// }
