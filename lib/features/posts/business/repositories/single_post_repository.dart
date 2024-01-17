import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/error/failure.dart';

import '../entities/post.dart';

abstract class SinglePostRepository {
  Future<Either<Failure, Post>> getSinglePost([int? postId]);
}