import 'package:flutter/material.dart';
import 'package:flutter_posts_tets/view/post_comments_screen.dart';
import 'package:flutter_posts_tets/view/user_list_screen.dart';
import 'package:provider/provider.dart';
import '../view_model/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<HomeViewModel>(
          builder: (context, viewModel, child) {
            return Text('Posts by ${viewModel.selectedUserName}');
          },
        ),
        actions: [
          IconButton(
            icon: const ImageIcon(
              AssetImage('assets/userIcon.png'),
              size: 24,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserListScreen()),
              );
            },
          ),
        ],
      ),
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          return ListView.separated(
            itemCount: viewModel.posts.length,
            itemBuilder: (context, index) {
              final post = viewModel.posts[index];
              return ListTile(
                title: Text(post.title),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostCommentsScreen(postId: post.id),
                    ),
                  );
                },
              );
            },
            separatorBuilder: (context, index) => const Divider(),
          );
        },
      ),
    );
  }
}

