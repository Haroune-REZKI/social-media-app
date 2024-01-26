import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/connection/network_info.dart';
import 'package:mobile_dev_project/core/error/exceptions.dart';
import 'package:mobile_dev_project/core/error/failure.dart';
import 'package:mobile_dev_project/features/posts/business/repositories/add_post.dart';
import 'package:mobile_dev_project/features/posts/data/datasource/remote_data_source.dart';

class AddPostRepositoryImpl implements AddPostRepository {
  final PostRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AddPostRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, bool>> addPost(AddPostOptions options) async {
    bool isConnected = await networkInfo.isConnected!;

    if (isConnected) {
      try {
        final result = await remoteDataSource.addPost(options);

        return Right(result);
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
