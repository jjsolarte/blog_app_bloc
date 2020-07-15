import 'package:blog_app_bloc/bloc/bloc/bloc_bloc.dart';
import 'package:blog_app_bloc/bloc/simple_delegate_bloc.dart';
import 'package:blog_app_bloc/repository/bloc_repository.dart';
import 'package:blog_app_bloc/ui/Home.dart';
import 'package:blog_app_bloc/ui/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/photo_upload.dart';

void main() {
  Bloc.observer = SimpleBlocDelegate();
  runApp(BlogApp());
}
class BlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlocBloc>(create: (context){
      return BlocBloc(blogRepository: BlogRepository())..add(LoadBlog());
    },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Blog App",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: HomePage()
        routes: {
          '/': (context) => Home(),
          '/addPost': (context) {
            return PhotoUpload(
              onSaveCallBack: (image, description){
                BlocProvider.of<BlocBloc>(context).add(AddPost(image, description));
              },
            );
          }
        },
      ),
    );
  }
}