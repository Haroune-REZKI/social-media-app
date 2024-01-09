import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/error/failure.dart';
import 'package:mobile_dev_project/features/authentication/business/entities/user.dart';

abstract class GetUserByTokenRepository {
  Future<Either<Failure, User>> getUserByToken(String token);
}
