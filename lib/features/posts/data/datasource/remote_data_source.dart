import 'package:dio/dio.dart';
import 'package:mobile_dev_project/core/constant/constant.dart';
import 'package:mobile_dev_project/core/error/exceptions.dart';
import 'dart:convert';

import 'package:mobile_dev_project/features/posts/business/repositories/add_post.dart';
import 'package:mobile_dev_project/features/posts/data/models/post.dart';

abstract class AddPostRemoteDataSource {
  Future<PostModel> addPost(AddPostOptions options);
}

class AddPostRemoteDataSourceImpl implements AddPostRemoteDataSource {
  late final Dio dio;

  AddPostRemoteDataSourceImpl({required this.dio});

  @override
  Future<PostModel> addPost(AddPostOptions options) async {
    print("Request content: ${options.content}");
      print("Request category id: ${options.categoryId}");
    try {
      
      final response = await dio.post(
        "$API_URL/posts",
        data: jsonEncode(
          {
            "content": options.content,
            "categoryId": options.categoryId,
          },
        ),
      );

      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.data}"); // Print the full response body

      if (response.statusCode == 200) {
        print("RECEIVED post DATA CORRECTLY");
        print(response.data.toString());
        return PostModel.fromJson(response.data);
      } else {
        print("DID NOT RECEIVED post DATA CORRECTLY");
        print(response.data.toString());

        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
