import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/error/failure.dart';
import 'package:mobile_dev_project/features/posts/business/entities/post.dart';

class AddPostOptions {
  String content;
  int categoryId;

  AddPostOptions({required this.content, required this.categoryId});
}

abstract class AddPostRepository {
  Future<Either<Failure, int>> addPost(AddPostOptions options);
}
