import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobile_dev_project/core/connection/network_info.dart';
import 'package:mobile_dev_project/features/posts/business/usecase/bookmark.dart';
import 'package:mobile_dev_project/features/posts/business/usecase/unbookmark.dart';
import 'package:mobile_dev_project/features/posts/data/datasource/remote_data_source.dart';
import 'package:mobile_dev_project/features/posts/data/repositories/bookmark_unbookmark.dart';

class BookmarkUnbookmarkController extends GetxController {
  var postId = 0.obs;
  var bookmarked = true.obs;

  BookmarkUnbookmarkController({
    required int postId_,
    required bool bookmarked_,
  }) {
    postId.value = postId_;
    bookmarked.value = bookmarked_;
  }

  void doBookmark() async {
    bookmarked.value = true;

    BookmarkUnbookmarkRepositoryImpl repository =
        BookmarkUnbookmarkRepositoryImpl(
      remoteDataSource: PostRemoteDataSourceImpl(
        dio: Dio(),
      ),
      networkInfo: NetworkInfoImpl(
        InternetConnectionChecker(),
      ),
    );

    final failureOrSuccess = await BookmarkPost(repository).call(postId.value);

    failureOrSuccess.fold(
      (failure) => {bookmarked.value = false},
      (status) => {},
    );
  }

  void doUnBookmark() async {
    bookmarked.value = false;

    BookmarkUnbookmarkRepositoryImpl repository =
        BookmarkUnbookmarkRepositoryImpl(
      remoteDataSource: PostRemoteDataSourceImpl(
        dio: Dio(),
      ),
      networkInfo: NetworkInfoImpl(
        InternetConnectionChecker(),
      ),
    );

    final failureOrSuccess =
        await UnBookmarkPost(repository).call(postId.value);

    failureOrSuccess.fold(
      (failure) => {bookmarked.value = true},
      (status) => {},
    );
  }
}
