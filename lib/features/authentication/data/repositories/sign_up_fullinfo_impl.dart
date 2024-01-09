import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/connection/network_info.dart';
import 'package:mobile_dev_project/core/error/exceptions.dart';
import 'package:mobile_dev_project/core/error/failure.dart';
import 'package:mobile_dev_project/features/authentication/business/repositories/sign_up_fullinfo_repository.dart';
import 'package:mobile_dev_project/features/authentication/data/datasource/remote_data_source.dart';
import 'package:mobile_dev_project/features/authentication/data/models/user.dart';

class SignUpFullInfoRepositoryImpl implements SignUpFullInfoRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  SignUpFullInfoRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserModel>> signUpFullInfo(
    SignUpFullInfoOptions options,
  ) async {
    bool isConnected = await networkInfo.isConnected!;

    if (isConnected) {
      try {
        print("FETCHING: $isConnected");
        final user = await remoteDataSource.signUpFullInfo(options);

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
        CacheFailure(
          errorMessage: "Error: No Local Data Found",
        ),
      );
    }
  }
}
