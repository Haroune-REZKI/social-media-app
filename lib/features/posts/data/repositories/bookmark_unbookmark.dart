import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/connection/network_info.dart';
import 'package:mobile_dev_project/core/error/exceptions.dart';
import 'package:mobile_dev_project/core/error/failure.dart';
import 'package:mobile_dev_project/features/posts/business/repositories/bookmark_unbookmark.dart';
import 'package:mobile_dev_project/features/posts/data/datasource/remote_data_source.dart';

class BookmarkUnbookmarkRepositoryImpl implements BookmarkUnbookmarkRepository {
  final PostRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  BookmarkUnbookmarkRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, bool>> bookmarkPost(int postId) async {
    bool isConnected = await networkInfo.isConnected!;

    if (isConnected) {
      try {
        final result = await remoteDataSource.bookmarkPost(postId);

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

  @override
  Future<Either<Failure, bool>> unBookmarkPost(int postId) async {
    bool isConnected = await networkInfo.isConnected!;

    if (isConnected) {
      try {
        final result = await remoteDataSource.unBookmarkPost(postId);

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
