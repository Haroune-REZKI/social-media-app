import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/connection/network_info.dart';
import 'package:mobile_dev_project/core/error/exceptions.dart';
import 'package:mobile_dev_project/core/error/failure.dart';
import 'package:mobile_dev_project/features/feed/business/repositories/list_of_posts_repository.dart';
import 'package:mobile_dev_project/features/profile/data/datasource/remote_datasource.dart';
import 'package:mobile_dev_project/features/profile/data/model/fav_posts_model.dart';

class FavPostsRepositoryImpl implements ListOfPostsRepository {
  final FavPostsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  FavPostsRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, ListOfPostsModel>> getListOfPosts([int? categoryId]) async {
    bool isConnected = await networkInfo.isConnected!;

    if (isConnected) {
      try {
        print("here's favlists posts impl repo, the remote data source will be called");
        final listOfPosts = await remoteDataSource.getListOfPosts(categoryId);
        print("------------ fav posts remote data source is done");

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
