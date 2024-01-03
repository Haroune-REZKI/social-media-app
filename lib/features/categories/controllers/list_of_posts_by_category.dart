import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobile_dev_project/core/connection/network_info.dart';
import 'package:mobile_dev_project/features/feed/business/entities/list_of_posts.dart';
import 'package:mobile_dev_project/features/feed/business/usecase/get_list_of_posts.dart';
import 'package:mobile_dev_project/features/feed/data/datasource/remote_data_source.dart';
import 'package:mobile_dev_project/features/feed/data/repositories/list_of_posts_repository_impl.dart';

class ListOfPostsByCategoryController extends GetxController
    with StateMixin<ListOfPosts> {
  int? categoryId;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  void setCategoryId(int category) {
    categoryId = category;
  }

  fetchPosts() async {
    change(ListOfPosts(posts: []), status: RxStatus.loading());
    ListOfPostsRepositoryImpl repository = ListOfPostsRepositoryImpl(
      remoteDataSource: ListOfPostsRemoteDataSourceImpl(
        dio: Dio(),
      ),
      networkInfo: NetworkInfoImpl(
        InternetConnectionChecker(),
      ),
    );

    print("CATEGORY ID $categoryId");
    
    final failureOrListOfPosts =
        await GetListOfPosts(repository).call(categoryId);

    failureOrListOfPosts.fold(
      (failure) => {
        // hasFailed.value = true;
        change(ListOfPosts(posts: []),
            status: RxStatus.error(failure.toString()))
      },
      (listOfPosts) => {
        // posts.value = listOfPosts
        change(listOfPosts, status: RxStatus.success())
      },
    );
  }
}
