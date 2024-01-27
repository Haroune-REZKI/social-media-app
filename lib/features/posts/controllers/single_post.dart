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
    print("controller initialized \n\n\n\n\n");
    fetchPosts();
  }
  SinglePostController({required postId_}){
    postId.value = postId_;
    fetchPosts();
    print(">>>>>>>>>>>>> controller: postID >>>>>> ${postId.value}");
  }
  var postId = 0.obs;

  fetchPosts() async {
    change(null, status: RxStatus.loading());
    print(">>>>>>>>>>>> controller will invoke Repository Implementation");
    SinglePostRepositoryImpl repository = SinglePostRepositoryImpl(
      remoteDataSource: SinglePostRemoteDataSourceImpl(
        dio: Dio(),
      ),
      networkInfo: NetworkInfoImpl(
        InternetConnectionChecker(),
      ),
    );
    
    final failureOrPost = await GetPost(repository).call(postId.value);
    print(">>>>>>>>>>>>> controller: result >>>>>> ${failureOrPost}");

    failureOrPost.fold(
      (failure) => {
        print("failure $failure"),
        // hasFailed.value = true;
        change(null,
            status: RxStatus.error(failure.toString()))
      },
      (post) => {
        print("post is retrieved ${post.content}"),
        // posts.value = post
        change(post, status: RxStatus.success())
      },
    );
  }
}

