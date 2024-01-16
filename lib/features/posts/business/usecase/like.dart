import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/error/failure.dart';
import 'package:mobile_dev_project/features/posts/business/repositories/like_unlike_repository.dart';

class LikePost {
  final LikeUnlikePostRepository repository;

  LikePost(this.repository);

  Future<Either<Failure, bool>> call(int postId) async {
    return await repository.likePost(postId);
  }
}
