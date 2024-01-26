import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobile_dev_project/core/connection/network_info.dart';
import 'package:mobile_dev_project/features/authentication/controllers/handlers.dart';
import 'package:mobile_dev_project/features/posts/business/repositories/add_post.dart';
import 'package:mobile_dev_project/features/posts/business/usecases/add_post.dart';
import 'package:mobile_dev_project/features/posts/data/datasource/remote_data_source.dart';
import 'package:mobile_dev_project/features/posts/data/repositories/add_post_impl.dart';
import 'package:mobile_dev_project/utils/components/custom_circular_progress_indicator.dart';

class AddPostController extends GetxController {
  TextEditingController postContentController = TextEditingController();

  void addPost(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CustomCircularProgressIndicator(),
      ),
    );

    print(
        "Sending post request with content: ${postContentController.text} and categoryId: 2");

    AddPostRepositoryImpl repository = AddPostRepositoryImpl(
      remoteDataSource: PostRemoteDataSourceImpl(dio: Dio()),
      networkInfo: NetworkInfoImpl(
        InternetConnectionChecker(),
      ),
    );

    final failureOrPost = await AddPost(repository).call(
      AddPostOptions(
        content: postContentController.text, categoryId: 2,
        //we do not need other options
      ),
    );

    failureOrPost.fold(
      (failure) => {
        Navigator.pop(context),
        print("=================${failure.errorMessage}"),
        displayMessageToUser("please try again later", context),
      },
      (post) => {
        // how to handle it if successful
        Navigator.pop(context),
        Get.toNamed("/feed"),
      },
    );
  }
}
