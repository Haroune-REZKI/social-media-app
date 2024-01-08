import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/error/failure.dart';
import 'package:mobile_dev_project/features/authentication/business/entities/user.dart';

class SignInOptions {
  String username;
  String password;

  SignInOptions({required this.username, required this.password});
}

abstract class SignInRepository {
  Future<Either<Failure, User>> signIn(SignInOptions options);
}
