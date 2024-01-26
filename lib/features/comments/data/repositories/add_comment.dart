import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/connection/network_info.dart';
import 'package:mobile_dev_project/core/error/exceptions.dart';
import 'package:mobile_dev_project/core/error/failure.dart';
import 'package:mobile_dev_project/features/comments/business/repositories/add_comment_repository.dart';
import 'package:mobile_dev_project/features/comments/data/datasource/remote_data_source.dart';

class AddCommentRepositoryImpl implements AddCommentRepository {
  final CommentRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AddCommentRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, bool>> addComment(AddCommentOptions options) async {
    bool isConnected = await networkInfo.isConnected!;

    if (isConnected) {
      try {
        final result = await remoteDataSource.addComment(options);

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
