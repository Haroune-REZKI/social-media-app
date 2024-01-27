import 'package:mobile_dev_project/features/authentication/business/entities/user.dart';

class Comment {
  int id;
  int userId;
  int postId;
  String createdAt;
  String content;
  User author;

  Comment({
    required this.id,
    required this.userId,
    required this.postId,
    required this.createdAt,
    required this.content,
    required this.author,
  });
}
