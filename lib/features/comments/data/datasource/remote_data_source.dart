import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobile_dev_project/core/constant/constant.dart';
import 'package:mobile_dev_project/core/error/exceptions.dart';
import 'package:mobile_dev_project/features/authentication/data/datasource/local_data_source.dart';
import 'package:mobile_dev_project/features/comments/business/repositories/add_comment_repository.dart';

abstract class CommentRemoteDataSource {
  Future<bool> addComment(AddCommentOptions options);
}

class CommentRemoteDataSourceImpl implements CommentRemoteDataSource {
  final Dio dio;

  CommentRemoteDataSourceImpl({required this.dio});

  @override
  Future<bool> addComment(AddCommentOptions options) async {
    try {
      String? userToken =
          await UserLocalDataSource.retrieveTokenFromLocalCache();

      final response = await dio.post(
        "$API_URL/posts/${options.postId}/add-comment",
        data: jsonEncode(
          {
            "content": options.content,
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
