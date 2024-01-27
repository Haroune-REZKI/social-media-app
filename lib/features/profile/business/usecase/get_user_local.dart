import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/error/failure.dart';
import 'package:mobile_dev_project/features/authentication/business/entities/user.dart';
import 'package:mobile_dev_project/features/profile/business/repository/get_user_local_repo.dart';

class GetUserLocal {
  final GetUserLocalRepository repository;

  GetUserLocal(this.repository);

  Future<Either<Failure, User>> call() async {
    return await repository.getUserLocal();
  }
}