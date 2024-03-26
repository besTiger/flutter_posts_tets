import 'package:flutter/foundation.dart';
import '../models/post.dart';
import '../models/user.dart';
import '../services/api_service.dart';


class HomeViewModel extends ChangeNotifier {
  List<Post> posts = [];
  List<User> users = [];
  User currentUser = User(id: 1, name: "Default User");
  String selectedUserName = "";

  final ApiService apiService = ApiService();

  HomeViewModel() {
    fetchPosts();
    fetchUsers();
  }

  Future<void> fetchPosts() async {
    try {
      posts = await apiService.getPosts();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchPostsByUser(int userId) async {
    try {
      posts = await apiService.getPostsByUser(userId);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchUsers() async {
    try {
      users = await apiService.getUsers();
      if (users.isNotEmpty) {
        selectedUserName = users.first.name;
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void setSelectedUserName(String name) {
    selectedUserName = name;
    notifyListeners();
  }
}