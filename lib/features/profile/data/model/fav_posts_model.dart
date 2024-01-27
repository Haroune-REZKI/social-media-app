
import 'package:mobile_dev_project/features/authentication/business/entities/user.dart';
import 'package:mobile_dev_project/features/comments/business/entities/comment.dart';
import 'package:mobile_dev_project/features/feed/business/entities/list_of_posts.dart';
import 'package:mobile_dev_project/features/posts/business/entities/like.dart';
import 'package:mobile_dev_project/features/posts/business/entities/post.dart';

class ListOfPostsModel extends ListOfPosts {
  ListOfPostsModel({required super.posts});

  factory ListOfPostsModel.fromJson(Map<String, dynamic> json) {
    List<Post> convertedListOfPosts = [];
    for (var element in json["data"]) {
      List<Comment> convertedComments = [];
      List<Like> convertedLikes = [];

      for (var comment in element["comments"]) {
        convertedComments.add(Comment(
          content: comment["content"],
          id: comment["id"],
          author: User(
            id: element["post"]["author"]["id"],
            fullname: element["post"]["author"]["fullname"],
            username: element["post"]["author"]["username"],
            email: element["post"]["author"]["email"],
            bio: element["post"]["author"]["bio"],
            createdAt: element["post"]["author"]["createdAt"],
            password: element["post"]["author"]["password"],
            phoneNumber: element["post"]["author"]["phoneNumber"],
            gender: element["post"]["author"]["gender"],
          ),
          userId: comment["userId"],
          postId: comment["postId"],
          createdAt: comment["createdAt"],
        ));
      }

      for (var comment in element["post"]["likes"]) {
        convertedLikes.add(Like(
          userId: comment["userId"],
          postId: comment["postId"],
          createdAt: comment["createdAt"],
        ));
      }

      Post currentPost = Post(
        id: element["post"]["id"],
        userId: element["post"]["userId"],
        categoryId: element["post"]["categoryId"],
        createdAt: element["createdAt"],
        author: User(
          id: element["post"]["author"]["id"],
          fullname: element["post"]["author"]["fullname"],
          username: element["post"]["author"]["username"],
          email: element["post"]["author"]["email"],
          bio: element["post"]["author"]["bio"],
          createdAt: element["post"]["author"]["createdAt"],
          password: element["post"]["author"]["password"],
          phoneNumber: element["post"]["author"]["phoneNumber"],
          gender: element["post"]["author"]["gender"],
        ),
        content: element["post"]["content"],
        likes: convertedLikes,
        hasLiked: element["hasLiked"],
        numberOfLikes: element["numberOfLikes"],
        comments: convertedComments,
        picture: element["post"]["picture"]
        //hasBookmarked: element["hasBookmarked"],
      );

      convertedListOfPosts.add(currentPost);
    }
    print("json decoding is done ");
    return ListOfPostsModel(posts: convertedListOfPosts);
  }

  Map<String, dynamic> toJson() {
    return {"posts": posts};
  }
}