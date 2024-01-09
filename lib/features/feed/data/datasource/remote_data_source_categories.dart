import "package:dio/dio.dart";
import 'package:mobile_dev_project/core/constant/constant.dart';
import 'package:mobile_dev_project/core/error/exceptions.dart';
import 'package:mobile_dev_project/features/feed/data/models/list_of_categories.dart';
import 'package:mobile_dev_project/features/feed/data/models/list_of_posts.dart';

abstract class ListOfCategoriesRemoteDataSource {
  Future<ListOfCategoriesModel> getListOfCategories();
}

class ListOfCategoriesRemoteDataSourceImpl implements ListOfCategoriesRemoteDataSource {
  final Dio dio;

  ListOfCategoriesRemoteDataSourceImpl({required this.dio});

  @override
  Future<ListOfCategoriesModel> getListOfCategories() async {
    final response = await dio.get(
      "https://social-media-app-backend-z8fl.onrender.com/api/v1/categories/my-categories-news",
      options: Options(
        headers: {
          "Authorization": "Bearer $USER_TOKEN",
        },
      ),
    );

    if (response.statusCode == 200) {
      print("RECEIVED DATA CORRECTLY");
      print(response.data.toString());
      return ListOfCategoriesModel.fromJson(response.data);
    } else {
      print("DID NOT RECEIVED DATA CORRECTLY");
      print(response.data.toString());

      throw ServerException();
    }
  }
}
