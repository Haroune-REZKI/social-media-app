import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/error/failure.dart';
import 'package:mobile_dev_project/features/authentication/business/entities/sign_up_return.dart';
import 'package:mobile_dev_project/features/authentication/business/repositories/sign_in.dart';

abstract class SignUpRepository {
  Future<Either<Failure, SignUpReturn>> signUp(SignInOptions options);
}
