import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobile_dev_project/core/connection/network_info.dart';
import 'package:mobile_dev_project/features/posts/business/entities/post.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mobile_dev_project/features/posts/business/usecase/get_post.dart';
import 'package:mobile_dev_project/features/posts/data/datasource/remote_data_source_post.dart';
import 'package:mobile_dev_project/features/posts/data/repositories/single_post_repository_impl.dart';

class SinglePostController extends GetxController
    with StateMixin<Post?> {
  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }
  SinglePostController({required postId});

  fetchPosts() async {
    change(null, status: RxStatus.loading());
    SinglePostRepositoryImpl repository = SinglePostRepositoryImpl(
      remoteDataSource: SinglePostRemoteDataSourceImpl(
        dio: Dio(),
      ),
      networkInfo: NetworkInfoImpl(
        InternetConnectionChecker(),
      ),
    );

    final failureOrPost = await GetPost(repository).call();

    failureOrPost.fold(
      (failure) => {
        // hasFailed.value = true;
        change(null,
            status: RxStatus.error(failure.toString()))
      },
      (post) => {
        // posts.value = post
        change(post, status: RxStatus.success())
      },
    );
  }
}

