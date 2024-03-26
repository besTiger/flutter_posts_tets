import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/home_view_model.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<HomeViewModel>(
          builder: (context, viewModel, child) {
            return Text(viewModel.selectedUserName);
          },
        ),
      ),
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          return ListView.separated(
            itemCount: viewModel.users.length,
            itemBuilder: (context, index) {
              final user = viewModel.users[index];
              return ListTile(
                title: Text(user.name),
                onTap: () {
                  Navigator.pop(context);
                  viewModel.fetchPostsByUser(user.id);
                  viewModel.setSelectedUserName(user.name);
                },
              );
            },
            separatorBuilder: (context, index) => Divider(),
          );
        },
      ),
    );
  }
}
