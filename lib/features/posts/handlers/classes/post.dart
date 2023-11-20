class Post {
  String fullname;
  String username;
  String avatar;
  String content;
  String likes;
  bool isLiked;
  bool hasImage;
  String comments;
  bool hasBookmarked;
  String timestamps;

  Post({
    required this.fullname,
    required this.username,
    required this.avatar,
    required this.content,
    required this.likes,
    required this.isLiked,
    required this.hasImage,
    required this.comments,
    required this.hasBookmarked,
    required this.timestamps,
  });
}
