import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/error/failure.dart';

class AddImageToPostOptions {
  int postId;
  File image;

  AddImageToPostOptions({required this.postId, required this.image});
}

abstract class AddImageToPostRepository {
  Future<Either<Failure, bool>> addImageToPost(AddImageToPostOptions options);
}
