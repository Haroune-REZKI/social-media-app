import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/error/failure.dart';
import 'package:mobile_dev_project/features/authentication/business/repositories/sign_up_fullinfo_repository.dart';
import 'package:mobile_dev_project/features/authentication/data/models/user.dart';

class SignUpFullInfo {
  final SignUpFullInfoRepository repository;

  SignUpFullInfo(this.repository);

  Future<Either<Failure, UserModel>> call(SignUpFullInfoOptions options) async {
    return await repository.signUpFullInfo(options);
  }
}
