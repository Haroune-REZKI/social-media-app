import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/error/failure.dart';
import 'package:mobile_dev_project/features/feed/business/entities/list_of_posts.dart';
import 'package:mobile_dev_project/features/feed/business/repositories/list_of_posts_repository.dart';

class GetListOfPosts {
  final ListOfPostsRepository repository;

  GetListOfPosts(this.repository);

  Future<Either<Failure, ListOfPosts>> call() async {
    return await repository.getListOfPosts();
  }
}
