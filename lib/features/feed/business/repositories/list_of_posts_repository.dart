import "package:dartz/dartz.dart";
import "package:mobile_dev_project/core/error/failure.dart";
import "package:mobile_dev_project/features/feed/business/entities/list_of_posts.dart";

abstract class ListOfPostsRepository {
  Future<Either<Failure, ListOfPosts>> getListOfPosts([int? categoryId]);
}
