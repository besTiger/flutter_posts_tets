import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/comments_view_model.dart';

class PostCommentsScreen extends StatelessWidget {
  final int postId;

  const PostCommentsScreen({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostCommentsViewModel(postId),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Comments'),
        ),
        body: Consumer<PostCommentsViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.comments.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.separated(
                itemCount: viewModel.comments.length,
                itemBuilder: (context, index) {
                  final comment = viewModel.comments[index];
                  return ListTile(
                    title: Text(comment.name),
                    subtitle: Text(comment.body),

                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              );
            }
          },
        ),
      ),
    );
  }
}
