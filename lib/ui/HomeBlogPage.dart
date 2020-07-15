import 'package:blog_app_bloc/bloc/bloc/bloc_bloc.dart';
import 'package:blog_app_bloc/models/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBlogPage extends StatefulWidget {
  @override
  _HomeBlogPageState createState() => _HomeBlogPageState();
}

class _HomeBlogPageState extends State<HomeBlogPage> {
  List<Post> postList = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocBloc, BlogState>(
      builder: (context, state) {
        if (state is BlogLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is BlogNoLoaded) {
          return Center(
            child: Column(
              children: <Widget>[Icon(Icons.error), Text("Cannot load Post")],
            ),
          );
        }
        if (state is BlogLoaded) {
          postList = state.posts;
          return Container(
            child: postList.length == 0
                ? Center(
                    child: Text("No Blog Avaliable"),
                  )
                : ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: (_, index) {
                      return postUI(
                        postList[index].image,
                        postList[index].description,
                        postList[index].date,
                        postList[index].time,
                      );
                    }),
          );
        }
        return Container();
      },
    );
  }

  Widget postUI(String image, String description, String date, String time) {
    return Card(
      elevation: 10.0,
      margin: EdgeInsets.all(14.0),
      child: Container(
        padding: EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              date, style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
            Text(
              time, style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0,),
            Image.network(image, fit: BoxFit.cover,),
            SizedBox(height: 10.0,),
            Text(description, style: Theme.of(context).textTheme.subtitle1, textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }


}
