import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobile_dev_project/core/constant/constant.dart';
import 'package:mobile_dev_project/core/error/exceptions.dart';
import 'package:mobile_dev_project/features/authentication/business/repositories/sign_in.dart';
import 'package:mobile_dev_project/features/authentication/business/repositories/sign_up_fullinfo_repository.dart';
import 'package:mobile_dev_project/features/authentication/data/models/sign_up_return_model.dart';
import 'package:mobile_dev_project/features/authentication/data/models/user.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signIn(SignInOptions options);
  Future<SignUpReturnModel> signUp(SignInOptions options);
  Future<UserModel> getUserByToken(String token);
  Future<UserModel> signUpFullInfo(SignUpFullInfoOptions options);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl({required this.dio});

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

  @override
  Future<UserModel> getUserByToken(String token) async {
    try {
      final response = await dio.get(
        "$API_URL/auth/get-user-info",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
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

  @override
  Future<SignUpReturnModel> signUp(SignInOptions options) async {
    try {
      final response = await dio.post(
        "$API_URL/auth/register",
        data: jsonEncode(
          {
            "username": options.username,
            "password": options.password,
          },
        ),
      );

      if (response.statusCode == 201) {
        print("RECEIVED DATA CORRECTLY");
        print(response.data.toString());
        return SignUpReturnModel.fromJson(response.data);
      } else {
        print("DID NOT RECEIVED DATA CORRECTLY");
        print(response.data.toString());

        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> signUpFullInfo(SignUpFullInfoOptions options) async {
    try {
      print("FETCHING 2 ${options.username}");
      final response = await dio.post(
        "$API_URL/auth/register-full-info",
        data: jsonEncode(
          {
            "username": options.username,
            "fullname": options.fullname,
            "email": options.email,
            "phoneNumber": options.phoneNumber,
            "gender": options.gender,
          },
        ),
        options: Options(
          headers: {
            "Authorization": "Bearer ${options.token}",
          },
        ),
      );

      print(response.data.toString());

      if (response.statusCode == 201) {
        print("RECEIVED DATA CORRECTLY");
        print(response.data.toString());
        return UserModel.fromJson(response.data);
      } else {
        print("DID NOT RECEIVED DATA CORRECTLY");
        print(response.data.toString());

        throw ServerException();
      }
    } catch (e) {
      print(e.toString());
      throw ServerException();
    }
  }
}
