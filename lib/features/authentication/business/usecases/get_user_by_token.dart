import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/error/failure.dart';
import 'package:mobile_dev_project/features/authentication/business/entities/user.dart';
import 'package:mobile_dev_project/features/authentication/business/repositories/get_user_by_token.dart';

class GetUserByToken {
  final GetUserByTokenRepository repository;

  GetUserByToken(this.repository);

  Future<Either<Failure, User>> call(String token) async {
    return await repository.getUserByToken(token);
  }
}
