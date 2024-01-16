import 'package:mobile_dev_project/features/posts/business/entities/like.dart';

class LikeModel extends Like {
  LikeModel({
    required super.postId,
    required super.userId,
    required super.createdAt,
  });

  factory LikeModel.fromJson(Map<String, dynamic> json) {
    return LikeModel(
      postId: json["postId"],
      userId: json["userId"],
      createdAt: json["createdAt"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "postId": postId,
      "userId": userId,
      "createdAt": createdAt,
    };
  }
}
