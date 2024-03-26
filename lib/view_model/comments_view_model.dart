import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/comment.dart';

class PostCommentsViewModel extends ChangeNotifier {
  List<Comment> comments = [];
  final int postId;

  PostCommentsViewModel(this.postId) {
    fetchComments();
  }

  Future<void> fetchComments() async {
    try {
      final response = await http.get(Uri.parse(
          'https://jsonplaceholder.typicode.com/comments?postId=$postId'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        comments = data.map((json) => Comment.fromJson(json)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load comments');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
