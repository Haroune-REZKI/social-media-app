import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/connection/network_info.dart';
import 'package:mobile_dev_project/core/error/failure.dart';
import 'package:mobile_dev_project/features/authentication/business/entities/user.dart';
import 'package:mobile_dev_project/features/authentication/data/datasource/local_data_source.dart';
import 'package:mobile_dev_project/features/authentication/data/models/user.dart';
import 'package:mobile_dev_project/features/profile/business/repository/get_user_local_repo.dart';

class GetUserLocalImpl implements GetUserLocalRepository {

  GetUserLocalImpl();

  @override
  Future<Either<Failure, UserModel>> getUserLocal() async {
      try {
        final user = await UserLocalDataSource.retrieveUserFromLocalCache();

        return Right(user!);
      } catch(e) {
        return Left(
          ServerFailure(
            errorMessage: "ERROR: Something wrong happened in the server",
          ),
        );
      }
  }
}
