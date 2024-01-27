import "package:dio/dio.dart";
import 'package:mobile_dev_project/core/constant/constant.dart';
import 'package:mobile_dev_project/core/error/exceptions.dart';
import 'package:mobile_dev_project/features/authentication/data/datasource/local_data_source.dart';
import 'package:mobile_dev_project/features/posts/business/repositories/add_image_to_post.dart';
import 'package:mobile_dev_project/features/posts/business/repositories/add_post.dart';

abstract class PostRemoteDataSource {
  Future<bool> likePost(int postId);
  Future<bool> unLikePost(int postId);
  Future<bool> bookmarkPost(int postId);
  Future<bool> unBookmarkPost(int postId);
  Future<int> addPost(AddPostOptions options);
  Future<bool> addImageToPost(AddImageToPostOptions options);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final Dio dio;

  PostRemoteDataSourceImpl({required this.dio});

  @override
  Future<int> addPost(AddPostOptions options) async {
    try {
      String? userToken =
          await UserLocalDataSource.retrieveTokenFromLocalCache();

      final response = await dio.post(
        "$API_URL/posts",
        data: {
          "content": options.content,
          "categoryId": options.categoryId,
        },
        options: Options(
          headers: {
            "Authorization": "Bearer $userToken",
          },
        ),
      );

      if (response.statusCode == 200) {
        print("RECEIVED DATA CORRECTLY");
        print(response.data.toString());
        return response.data["data"]["id"];
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

  @override
  Future<bool> likePost(int postId) async {
    try {
      String? userToken =
          await UserLocalDataSource.retrieveTokenFromLocalCache();

      if (userToken == null) {
        throw CacheException();
      }

      dynamic response = await dio.post(
        "$API_URL/posts/$postId/like",
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

  @override
  Future<bool> unLikePost(int postId) async {
    try {
      String? userToken =
          await UserLocalDataSource.retrieveTokenFromLocalCache();

      if (userToken == null) {
        throw CacheException();
      }

      dynamic response = await dio.post(
        "$API_URL/posts/$postId/unlike",
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

  @override
  Future<bool> bookmarkPost(int postId) async {
    try {
      String? userToken =
          await UserLocalDataSource.retrieveTokenFromLocalCache();

      if (userToken == null) {
        throw CacheException();
      }

      dynamic response = await dio.post(
        "$API_URL/posts/$postId/bookmark",
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

  @override
  Future<bool> unBookmarkPost(int postId) async {
    try {
      String? userToken =
          await UserLocalDataSource.retrieveTokenFromLocalCache();

      if (userToken == null) {
        throw CacheException();
      }

      dynamic response = await dio.post(
        "$API_URL/posts/$postId/unbookmark",
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

  @override
  Future<bool> addImageToPost(AddImageToPostOptions options) async {
    try {
      String? userToken =
          await UserLocalDataSource.retrieveTokenFromLocalCache();

      if (userToken == null) {
        throw CacheException();
      }

      String filename = options.image.path.split("/").last;

      dynamic response = await dio.post(
        "$API_URL/posts/${options.postId}/image-upload",
        options: Options(
          headers: {
            "Authorization": "Bearer $userToken",
          },
        ),
        data: FormData.fromMap(
          {
            "image": await MultipartFile.fromFile(
              options.image.path,
              filename: filename,
            )
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
