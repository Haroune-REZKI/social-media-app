import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/error/failure.dart';
import 'package:mobile_dev_project/features/posts/business/entities/post.dart';
import 'package:mobile_dev_project/features/posts/business/repositories/add_post.dart';

class AddPost {
  final AddPostRepository repository;
  AddPost(this.repository);

  Future<Either<Failure, Post>> call(AddPostOptions options) async {
    return await repository.addPost(options);
  }
}
