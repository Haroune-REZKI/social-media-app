
import 'package:mobile_dev_project/features/posts/business/entities/post.dart';

class PostModel extends Post {
  PostModel({
    required super.content, // Added content to constructor
    required super.categoryId,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      content: json['content'] as String,
      categoryId: json['categoryId'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'categoryId': categoryId,
    };
  }
}
