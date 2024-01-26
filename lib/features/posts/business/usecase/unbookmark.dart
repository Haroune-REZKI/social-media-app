import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/error/failure.dart';
import 'package:mobile_dev_project/features/posts/business/repositories/bookmark_unbookmark.dart';

class UnBookmarkPost {
  final BookmarkUnbookmarkRepository repository;

  UnBookmarkPost(this.repository);

  Future<Either<Failure, bool>> call(int postId) async {
    return await repository.unBookmarkPost(postId);
  }
}
