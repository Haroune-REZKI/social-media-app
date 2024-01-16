import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/connection/network_info.dart';
import 'package:mobile_dev_project/core/error/exceptions.dart';
import 'package:mobile_dev_project/core/error/failure.dart';
import 'package:mobile_dev_project/features/authentication/business/repositories/sign_in.dart';
import 'package:mobile_dev_project/features/authentication/data/datasource/remote_data_source.dart';
import 'package:mobile_dev_project/features/posts/business/entities/post.dart';
import 'package:mobile_dev_project/features/posts/business/repositories/add_post.dart';
import 'package:mobile_dev_project/features/posts/data/datasource/remote_data_source.dart';
import 'package:mobile_dev_project/features/posts/data/models/post.dart';
import 'package:mobile_dev_project/features/posts/views/add_post.dart';

class AddPostRepositoryImpl implements AddPostRepository {
  final AddPostRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AddPostRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, PostModel>> addPost(AddPostOptions options) async {
    bool isConnected = await networkInfo.isConnected!;

    if (isConnected) {
      try {
        final post = await remoteDataSource.addPost(options);

        return Right(post);
      } on ServerException {
        return Left(
          ServerFailure(
              errorMessage: "ERROR: Something wrong happened in the server"),
        );
      }
    } else {
      return Left(
        CacheFailure(errorMessage: "Error: No Local Data Found"),
      );
    }
  }
}
