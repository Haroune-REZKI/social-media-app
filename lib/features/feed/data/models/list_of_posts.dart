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
            id: element["author"]["id"],
            fullname: element["author"]["fullname"],
            username: element["author"]["username"],
            email: element["author"]["email"],
            bio: element["author"]["bio"],
            createdAt: element["author"]["createdAt"],
            password: element["author"]["password"],
            phoneNumber: element["author"]["phoneNumber"],
            gender: element["author"]["gender"],
          ),
          userId: comment["userId"],
          postId: comment["postId"],
          createdAt: comment["createdAt"],
        ));
      }

      for (var comment in element["likes"]) {
        convertedLikes.add(Like(
          userId: comment["userId"],
          postId: comment["postId"],
          createdAt: comment["createdAt"],
        ));
      }

      Post currentPost = Post(
        id: element["id"],
        userId: element["userId"],
        categoryId: element["categoryId"],
        createdAt: element["createdAt"],
        author: User(
          id: element["author"]["id"],
          fullname: element["author"]["fullname"],
          username: element["author"]["username"],
          email: element["author"]["email"],
          bio: element["author"]["bio"],
          createdAt: element["author"]["createdAt"],
          password: element["author"]["password"],
          phoneNumber: element["author"]["phoneNumber"],
          gender: element["author"]["gender"],
        ),
        content: element["content"],
        likes: convertedLikes,
        hasLiked: element["hasLiked"],
        hasBookmarked: element["hasBookmarked"],
        numberOfLikes: element["numberOfLikes"],
        comments: convertedComments,
        picture: element["picture"]
        // hasBookmarked: element["hasBookmarked"],
      );

      convertedListOfPosts.add(currentPost);
    }

    return ListOfPostsModel(posts: convertedListOfPosts);
  }

  Map<String, dynamic> toJson() {
    return {"posts": posts};
  }
}
