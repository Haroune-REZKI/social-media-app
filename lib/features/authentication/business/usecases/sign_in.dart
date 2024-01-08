import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/error/failure.dart';
import 'package:mobile_dev_project/features/authentication/business/entities/user.dart';
import 'package:mobile_dev_project/features/authentication/business/repositories/sign_in.dart';

class SignIn {
  final SignInRepository repository;

  SignIn(this.repository);

  Future<Either<Failure, User>> call(SignInOptions options) async {
    return await repository.signIn(options);
  }
}
