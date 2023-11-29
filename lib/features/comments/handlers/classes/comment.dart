class Comment {
  int id;
  String fullname;
  String username;
  String avatar;
  String content;
  String likes;
  bool isLiked;
  bool hasBookmarked;
  String timestamps;

  Comment({
    required this.id,
    required this.fullname,
    required this.username,
    required this.avatar,
    required this.content,
    required this.likes,
    required this.isLiked,
    required this.hasBookmarked,
    required this.timestamps,
  });
}
