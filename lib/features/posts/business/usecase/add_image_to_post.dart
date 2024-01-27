import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/error/failure.dart';
import 'package:mobile_dev_project/features/posts/business/repositories/add_image_to_post.dart';

class AddImageToPost {
  final AddImageToPostRepository repository;
  AddImageToPost(this.repository);

  Future<Either<Failure, bool>> call(AddImageToPostOptions options) async {
    return await repository.addImageToPost(options);
  }
}
