import 'package:dio/dio.dart';
import 'package:mobile_dev_project/core/constant/constant.dart';
import 'package:mobile_dev_project/core/error/exceptions.dart';
import 'package:mobile_dev_project/features/authentication/data/datasource/local_data_source.dart';
import 'package:mobile_dev_project/features/profile/data/model/fav_posts_model.dart';

abstract class FavPostsRemoteDataSource {
  Future<ListOfPostsModel> getListOfPosts([int? categoryId]);
}

class FavPostsRemoteDataSourceImpl implements FavPostsRemoteDataSource {
  final Dio dio;

  FavPostsRemoteDataSourceImpl({required this.dio});

  @override
  Future<ListOfPostsModel> getListOfPosts([int? categoryId]) async {
    dynamic response;

    String? userToken = await UserLocalDataSource.retrieveTokenFromLocalCache();

    if (categoryId == null) {
      response = await dio.get(
        "$API_URL/posts/my-bookmarked-posts",
        options: Options(
          headers: {
            "Authorization": "Bearer $userToken",
          },
        ),
      );
    } else {
      response = await dio.get(
        "$API_URL/posts",
        options: Options(
          headers: {
            "Authorization": "Bearer $userToken",
          },
        ),
        queryParameters: {
          "categoryId": categoryId,
        },
      );
    }

    if (response.statusCode == 200) {
      print("RECEIVED DATA CORRECTLY  from fav posts");
      print(response.data.toString());
      return ListOfPostsModel.fromJson(response.data);
    } else {
      print("DID NOT RECEIVED DATA CORRECTLY");
      print(response.data.toString());

      throw ServerException();
    }
  }
}
