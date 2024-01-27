import 'package:mobile_dev_project/features/authentication/business/entities/user.dart';
import 'package:mobile_dev_project/features/comments/business/entities/comment.dart';
import 'package:mobile_dev_project/features/posts/business/entities/like.dart';

class Post {
  int id;
  int userId;
  int categoryId;
  String createdAt;
  String content;
  List<Comment> comments;
  User author;
  List<Like> likes;
  int numberOfLikes;
  bool hasLiked;
  String? picture;

  Post({
    required this.id,
    required this.userId,
    required this.categoryId,
    required this.createdAt,
    required this.author,
    required this.content,
    required this.likes,
    required this.hasLiked,
    required this.numberOfLikes,
    required this.comments,
    required this.picture,
  });
}
