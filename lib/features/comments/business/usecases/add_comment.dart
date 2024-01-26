import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/error/failure.dart';
import 'package:mobile_dev_project/features/comments/business/repositories/add_comment_repository.dart';

class AddComment {
  final AddCommentRepository repository;

  AddComment(this.repository);

  Future<Either<Failure, bool>> call(AddCommentOptions options) async {
    return await repository.addComment(options);
  }
}
