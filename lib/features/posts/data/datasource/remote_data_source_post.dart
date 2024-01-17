import 'package:dio/dio.dart';
import 'package:mobile_dev_project/core/constant/constant.dart';
import 'package:mobile_dev_project/core/error/exceptions.dart';
import 'package:mobile_dev_project/features/posts/data/models/single_post_model.dart';

abstract class SinglePostRemoteDataSource {
  Future<SinglePostModel> getSinglePost(int postId);
}

class SinglePostRemoteDataSourceImpl implements SinglePostRemoteDataSource {
  final Dio dio;

  SinglePostRemoteDataSourceImpl({required this.dio});

  @override
  Future<SinglePostModel> getSinglePost(int postId) async {
    dynamic response;

    response = await dio.get(
      "$API_URL/posts/$postId",
      options: Options(
        headers: {
          "Authorization": "Bearer $USER_TOKEN",
        },
      ),
    );

    if (response.statusCode == 200) {
      print("RECEIVED DATA CORRECTLY");
      print(response.data.toString());
      return SinglePostModel.fromJson(response.data);
    } else {
      print("DID NOT RECEIVED DATA CORRECTLY");
      print(response.data.toString());

      throw ServerException();
    }
  }
}
