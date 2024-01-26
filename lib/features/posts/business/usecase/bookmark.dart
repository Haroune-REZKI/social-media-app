import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/error/failure.dart';
import 'package:mobile_dev_project/features/posts/business/repositories/bookmark_unbookmark.dart';

class BookmarkPost {
  final BookmarkUnbookmarkRepository repository;

  BookmarkPost(this.repository);

  Future<Either<Failure, bool>> call(int postId) async {
    return await repository.bookmarkPost(postId);
  }
}
