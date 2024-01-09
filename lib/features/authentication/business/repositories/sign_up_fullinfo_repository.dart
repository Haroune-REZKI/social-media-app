import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/error/failure.dart';
import 'package:mobile_dev_project/features/authentication/data/models/user.dart';

class SignUpFullInfoOptions {
  String username;
  String fullname;
  String email;
  String phoneNumber;
  String gender;
  String token;

  SignUpFullInfoOptions({
    required this.token,
    required this.username,
    required this.fullname,
    required this.email,
    required this.phoneNumber,
    required this.gender,
  });
}

abstract class SignUpFullInfoRepository {
  Future<Either<Failure, UserModel>> signUpFullInfo(
      SignUpFullInfoOptions options);
}
