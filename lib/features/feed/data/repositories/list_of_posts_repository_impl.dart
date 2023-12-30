import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/connection/network_info.dart';
import 'package:mobile_dev_project/core/error/exceptions.dart';
import 'package:mobile_dev_project/core/error/failure.dart';
import 'package:mobile_dev_project/features/feed/business/repositories/list_of_posts_repository.dart';
import 'package:mobile_dev_project/features/feed/data/datasource/remote_data_source.dart';
import 'package:mobile_dev_project/features/feed/data/models/list_of_posts.dart';

class ListOfPostsRepositoryImpl implements ListOfPostsRepository {
  final ListOfPostsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ListOfPostsRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, ListOfPostsModel>> getListOfPosts() async {
    bool isConnected = await networkInfo.isConnected!;

    if (isConnected) {
      try {
        final listOfPosts = await remoteDataSource.getListOfPosts();

        return Right(listOfPosts);
      } on ServerException {
        return Left(ServerFailure(
            errorMessage: "ERROR: Something wrong happened in the server"));
      }
    } else {
      return Left(CacheFailure(errorMessage: "ERROR: No Local Data Found"));
    }
  }
}
