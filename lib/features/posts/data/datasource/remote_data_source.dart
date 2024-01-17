import 'package:dio/dio.dart';
import 'package:mobile_dev_project/core/constant/constant.dart';
import 'package:mobile_dev_project/core/error/exceptions.dart';
import 'dart:convert';

import 'package:mobile_dev_project/features/posts/business/repositories/add_post.dart';

abstract class AddPostRemoteDataSource {
  Future<bool> addPost(AddPostOptions options);
}

class AddPostRemoteDataSourceImpl implements AddPostRemoteDataSource {
  final Dio dio;

  AddPostRemoteDataSourceImpl({required this.dio});

  @override
  Future<bool> addPost(AddPostOptions options) async {
    try {
      String? userToken =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Imh1Z29vIiwiaWF0IjoxNzAyNDc3MzcwLCJleHAiOjE3MDUwNjkzNzB9.GQztYDENYQkb_c9tRd2lhNx8s3pHeO2Ek-AQNua3nLo";

      final response = await dio.post(
        "$API_URL/posts",
        data: jsonEncode(
          {
            "content": options.content,
            "categoryId": options.categoryId,
          },
        ),
        options: Options(
          headers: {
            "Authorization": "Bearer $userToken",
          },
        ),
      );

      if (response.statusCode == 200) {
        print("RECEIVED DATA CORRECTLY");
        print(response.data.toString());
        return true;
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
