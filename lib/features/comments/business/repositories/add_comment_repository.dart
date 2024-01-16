import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/error/failure.dart';

class AddCommentOptions {
  String content;
  int postId;

  AddCommentOptions({required this.content, required this.postId});
}

abstract class AddCommentRepository {
  Future<Either<Failure, bool>> addComment(AddCommentOptions options);
}
