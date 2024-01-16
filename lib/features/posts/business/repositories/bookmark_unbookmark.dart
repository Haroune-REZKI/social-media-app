import "package:dartz/dartz.dart";
import "package:mobile_dev_project/core/error/failure.dart";

abstract class BookmarkUnbookmarkRepository {
  Future<Either<Failure, bool>> bookmarkPost(int postId);
  Future<Either<Failure, bool>> unBookmarkPost(int postId);
}
