import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobile_dev_project/core/connection/network_info.dart';
import 'package:mobile_dev_project/features/posts/business/usecase/like.dart';
import 'package:mobile_dev_project/features/posts/business/usecase/unlike.dart';
import 'package:mobile_dev_project/features/posts/data/datasource/remote_data_source.dart';
import 'package:mobile_dev_project/features/posts/data/repositories/like_unlike_repository.dart';

class LikeUnlikeController extends GetxController {
  var postId = 0.obs;
  var likes = 0.obs;
  var liked = true.obs;

  LikeUnlikeController({
    required int postId_,
    required bool liked_,
    required int likes_,
  }) {
    postId.value = postId_;
    liked.value = liked_;
    likes.value = likes_;
  }

  void doLike() async {
    liked.value = true;
    likes.value = likes.value + 1;

    LikeUnlikePostRepositoryImpl repository = LikeUnlikePostRepositoryImpl(
      remoteDataSource: PostRemoteDataSourceImpl(
        dio: Dio(),
      ),
      networkInfo: NetworkInfoImpl(
        InternetConnectionChecker(),
      ),
    );

    final failureOrSuccess = await LikePost(repository).call(postId.value);

    failureOrSuccess.fold(
      (failure) => {liked.value = false, likes.value = likes.value - 1},
      (status) => {},
    );
  }

  void doUnLike() async {
    liked.value = false;
    likes.value = likes.value - 1;

    LikeUnlikePostRepositoryImpl repository = LikeUnlikePostRepositoryImpl(
      remoteDataSource: PostRemoteDataSourceImpl(
        dio: Dio(),
      ),
      networkInfo: NetworkInfoImpl(
        InternetConnectionChecker(),
      ),
    );

    final failureOrSuccess = await UnLikePost(repository).call(postId.value);

    failureOrSuccess.fold(
      (failure) => {liked.value = true, likes.value = likes.value + 1},
      (status) => {},
    );
  }
}
