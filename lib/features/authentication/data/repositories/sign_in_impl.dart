import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/connection/network_info.dart';
import 'package:mobile_dev_project/core/error/exceptions.dart';
import 'package:mobile_dev_project/core/error/failure.dart';
import 'package:mobile_dev_project/features/authentication/business/repositories/sign_in.dart';
import 'package:mobile_dev_project/features/authentication/data/datasource/remote_data_source.dart';
import 'package:mobile_dev_project/features/authentication/data/models/user.dart';

class SignInRepositoryImpl implements SignInRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  SignInRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserModel>> signIn(SignInOptions options) async {
    bool isConnected = await networkInfo.isConnected!;

    if (isConnected) {
      try {
        final user = await remoteDataSource.signIn(options);

        return Right(user);
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
