import 'package:mobile_dev_project/features/authentication/business/entities/user.dart';
import 'package:mobile_dev_project/features/comments/business/entities/comment.dart';
import 'package:mobile_dev_project/features/posts/business/entities/like.dart';
import 'package:mobile_dev_project/features/posts/business/entities/post.dart';

class SinglePostModel extends Post {
  SinglePostModel({required Post post})
      : super(
            id: post.id,
            userId: post.userId,
            categoryId: post.categoryId,
            createdAt: post.createdAt,
            author: post.author,
            content: post.content,
            likes: post.likes,
            hasLiked: post.hasLiked,
            numberOfLikes: post.numberOfLikes,
            comments: post.comments);

  factory SinglePostModel.fromJson(Map<String, dynamic> json) {
    print("single post model is starting");
    List<Comment> convertedComments = [];
    List<Like> convertedLikes = [];
    var element = json["data"];
    for (var comment in element["comments"]) {
      convertedComments.add(Comment(
        content: comment["content"],
        id: comment["id"],
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
      numberOfLikes: element["numberOfLikes"],
      comments: convertedComments,
      // hasBookmarked: element["hasBookmarked"],
    );

    print("single post model is done");
    return SinglePostModel(post: currentPost);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userId": userId,
      "categoryId": categoryId,
      "createdAt": createdAt,
      "author": author,
      "content": content,
      "likes": likes,
      "hasLiked": hasLiked,
      "numberOfLikes": numberOfLikes,
      "comments": comments
    };
  }
}
