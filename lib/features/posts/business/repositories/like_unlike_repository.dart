import "package:dartz/dartz.dart";
import "package:mobile_dev_project/core/error/failure.dart";

abstract class LikeUnlikePostRepository {
  Future<Either<Failure, bool>> likePost(int postId);
  Future<Either<Failure, bool>> unLikePost(int postId);
}
