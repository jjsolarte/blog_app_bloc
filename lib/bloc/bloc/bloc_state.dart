part of 'bloc_bloc.dart';


abstract class BlogState extends Equatable{

  const BlogState();

  @override
  List<Object> get props => [];
}

//Tres estados
// 1. Blog loading
// 2. Blog loaded
// 3. Blog no loaded

class BlogLoading extends BlogState{
  @override
  String toString()=> 'Blog Loading';
}

class BlogLoaded extends BlogState{
  List<Post> posts;

  BlogLoaded(this.posts);

  @override
  List<Object> get props => [posts];

  @override
  String toString()=> 'Blog Loaed';
}

class BlogNoLoaded extends BlogState{
  @override
  String toString()=> 'Blog No Loaded';
}
