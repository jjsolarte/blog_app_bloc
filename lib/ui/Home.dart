import 'package:blog_app_bloc/bloc/bloc/bloc_bloc.dart';
import 'package:blog_app_bloc/repository/bloc_repository.dart';
import 'package:blog_app_bloc/ui/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'HomeBlogPage.dart';

class Home extends StatelessWidget {
  final BlogRepository _blogRepository = BlogRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlocBloc>(
      create: (context) =>
          BlocBloc(blogRepository: _blogRepository)..add(LoadBlog()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: HomeBlogPage(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          tooltip: "Add Post",
          onPressed: () => Navigator.pushNamed(context, '/addPost'),
        ),
      ),
    );
  }
}
