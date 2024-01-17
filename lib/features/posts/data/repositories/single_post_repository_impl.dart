import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/connection/network_info.dart';
import 'package:mobile_dev_project/core/error/exceptions.dart';
import 'package:mobile_dev_project/core/error/failure.dart';
import 'package:mobile_dev_project/features/posts/business/entities/post.dart';
import 'package:mobile_dev_project/features/posts/business/repositories/single_post_repository.dart';
import 'package:mobile_dev_project/features/posts/data/datasource/remote_data_source_post.dart';
import 'package:mobile_dev_project/features/posts/data/models/single_post_model.dart';

class SinglePostRepositoryImpl implements SinglePostRepository {
  final SinglePostRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  SinglePostRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, SinglePostModel>> getSinglePost(int postId) async {
    bool isConnected = await networkInfo.isConnected!;
  print("single post repo impl is starting");
    if (isConnected) {
      try {

        final currentPost = await remoteDataSource.getSinglePost(postId);
        print("single post repo impl is done");

        return Right(currentPost);
      } on ServerException {
        return Left(ServerFailure(
            errorMessage: "ERROR: Something wrong happened in the server"));
      }
    } else {
      return Left(CacheFailure(errorMessage: "ERROR: No Local Data Found"));
    }
  }
}