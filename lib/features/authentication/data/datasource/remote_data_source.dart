import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobile_dev_project/core/constant/constant.dart';
import 'package:mobile_dev_project/core/error/exceptions.dart';
import 'package:mobile_dev_project/features/authentication/business/repositories/sign_in.dart';
import 'package:mobile_dev_project/features/authentication/data/models/user.dart';

abstract class SignInRemoteDataSource {
  Future<UserModel> signIn(SignInOptions options);
}

class SignInRemoteDataSourceImpl implements SignInRemoteDataSource {
  final Dio dio;

  SignInRemoteDataSourceImpl({required this.dio});

  @override
  Future<UserModel> signIn(SignInOptions options) async {
    try {
      final response = await dio.post(
        "$API_URL/auth/login",
        data: jsonEncode(
          {
            "username": options.username,
            "password": options.password,
          },
        ),
      );

      if (response.statusCode == 200) {
        print("RECEIVED DATA CORRECTLY");
        print(response.data.toString());
        return UserModel.fromJson(response.data);
      } else {
        print("DID NOT RECEIVED DATA CORRECTLY");
        print(response.data.toString());

        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
