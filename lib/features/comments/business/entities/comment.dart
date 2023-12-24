class Comment {
  int id;
  int userId;
  int postId;
  String createdAt;
  String content;

  Comment({
    required this.id,
    required this.userId,
    required this.postId,
    required this.createdAt,
    required this.content,
  });
}
