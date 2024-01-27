import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobile_dev_project/core/connection/network_info.dart';
import 'package:mobile_dev_project/features/feed/business/entities/list_of_posts.dart';
import 'package:mobile_dev_project/features/feed/business/usecase/get_list_of_posts.dart';
import 'package:mobile_dev_project/features/profile/data/datasource/remote_datasource.dart';
import 'package:mobile_dev_project/features/profile/data/repository/fav_posts_list.dart';

class FavPostsController extends GetxController
    with StateMixin<ListOfPosts> {
  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  fetchPosts() async {
    print("fetch posts is going to work now");
    change(ListOfPosts(posts: []), status: RxStatus.loading());
    FavPostsRepositoryImpl repository = FavPostsRepositoryImpl(
      remoteDataSource: FavPostsRemoteDataSourceImpl(
        dio: Dio(),
      ),
      networkInfo: NetworkInfoImpl(
        InternetConnectionChecker(),
      ),
    );

    print("fetch fav posts will invoke the repo");
    final failureOrListOfPosts = await GetListOfPosts(repository).call();
    print("fatch fav posts repo is done");

    failureOrListOfPosts.fold(
      (failure) => {
        // hasFailed.value = true;
        change(ListOfPosts(posts: []),
            status: RxStatus.error(failure.toString()))
      },
      (listOfPosts) => {
        print(">>>>>>>>>>>>>>>>>>> saved posts: ${listOfPosts.posts.length}"),
        // posts.value = listOfPosts
        change(listOfPosts, status: RxStatus.success())
      },
    );
  }
}