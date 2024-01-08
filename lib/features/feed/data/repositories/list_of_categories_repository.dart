import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/connection/network_info.dart';
import 'package:mobile_dev_project/core/error/exceptions.dart';
import 'package:mobile_dev_project/core/error/failure.dart';
import 'package:mobile_dev_project/features/feed/business/repositories/list_of_categories_repository.dart';
import 'package:mobile_dev_project/features/feed/data/datasource/remote_data_source_categories.dart';
import 'package:mobile_dev_project/features/feed/data/models/list_of_categories.dart';

class ListOfCategoriesRepositoryImpl implements ListOfCategoriesRepository {
  final ListOfCategoriesRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ListOfCategoriesRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, ListOfCategoriesModel>> getListOfCategories() async {
    bool isConnected = await networkInfo.isConnected!;

    if (isConnected) {
      try {
        final listOfCategories = await remoteDataSource.getListOfCategories();

        return Right(listOfCategories);
      } on ServerException {
        return Left(ServerFailure(
            errorMessage: "ERROR: Something wrong happened in the server"));
      }
    } else {
      return Left(CacheFailure(errorMessage: "ERROR: No Local Data Found"));
    }
  }
}
