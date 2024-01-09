import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/error/failure.dart';
import 'package:mobile_dev_project/features/authentication/business/entities/sign_up_return.dart';
import 'package:mobile_dev_project/features/authentication/business/repositories/sign_in.dart';
import 'package:mobile_dev_project/features/authentication/business/repositories/sign_up.dart';

class SignUp {
  final SignUpRepository repository;

  SignUp(this.repository);

  Future<Either<Failure, SignUpReturn>> call(SignInOptions options) async {
    return await repository.signUp(options);
  }
}
