import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/error/failure.dart';
import 'package:mobile_dev_project/features/posts/business/entities/post.dart';
import 'package:mobile_dev_project/features/posts/business/repositories/single_post_repository.dart';

class GetPost {
  final SinglePostRepository repository;

  GetPost(this.repository);

  Future<Either<Failure, Post>> call(int postId) async {
    return await repository.getSinglePost(postId);
  }
}
