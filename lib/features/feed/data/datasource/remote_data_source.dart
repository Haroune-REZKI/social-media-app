import "package:dio/dio.dart";
import 'package:mobile_dev_project/core/constant/constant.dart';
import 'package:mobile_dev_project/core/error/exceptions.dart';
import 'package:mobile_dev_project/features/feed/data/models/list_of_posts.dart';

abstract class ListOfPostsRemoteDataSource {
  Future<ListOfPostsModel> getListOfPosts([int? categoryId]);
}

class ListOfPostsRemoteDataSourceImpl implements ListOfPostsRemoteDataSource {
  final Dio dio;

  ListOfPostsRemoteDataSourceImpl({required this.dio});

  @override
  Future<ListOfPostsModel> getListOfPosts([int? categoryId]) async {
    dynamic response;

    if (categoryId == null) {
      response = await dio.get(
        "$API_URL/posts",
        options: Options(
          headers: {
            "Authorization": "Bearer $USER_TOKEN",
          },
        ),
      );
    } else {
      response = await dio.get(
        "$API_URL/posts",
        options: Options(
          headers: {
            "Authorization": "Bearer $USER_TOKEN",
          },
        ),
        queryParameters: {
          "categoryId": categoryId,
        },
      );
    }

    if (response.statusCode == 200) {
      print("RECEIVED DATA CORRECTLY");
      print(response.data.toString());
      return ListOfPostsModel.fromJson(response.data);
    } else {
      print("DID NOT RECEIVED DATA CORRECTLY");
      print(response.data.toString());

      throw ServerException();
    }
  }
}
