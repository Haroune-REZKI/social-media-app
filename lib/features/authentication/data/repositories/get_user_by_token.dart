import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/connection/network_info.dart';
import 'package:mobile_dev_project/core/error/exceptions.dart';
import 'package:mobile_dev_project/core/error/failure.dart';
import 'package:mobile_dev_project/features/authentication/business/entities/user.dart';
import 'package:mobile_dev_project/features/authentication/business/repositories/get_user_by_token.dart';
import 'package:mobile_dev_project/features/authentication/data/datasource/remote_data_source.dart';

class GetUserByTokenImpl implements GetUserByTokenRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  GetUserByTokenImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, User>> getUserByToken(String token) async {
    bool isConnected = await networkInfo.isConnected!;

    if (isConnected) {
      try {
        final user = await remoteDataSource.getUserByToken(token);

        return Right(user);
      } on ServerException {
        return Left(
          ServerFailure(
            errorMessage: "ERROR: Something wrong happened in the server",
          ),
        );
      }
    } else {
      return Left(
        CacheFailure(errorMessage: "Error: No Local Data Found"),
      );
    }
  }
}
