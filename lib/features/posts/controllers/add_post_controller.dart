import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobile_dev_project/core/connection/network_info.dart';
import 'package:mobile_dev_project/features/authentication/controllers/handlers.dart';
import 'package:mobile_dev_project/features/posts/business/repositories/add_image_to_post.dart';
import 'package:mobile_dev_project/features/posts/business/repositories/add_post.dart';
import 'package:mobile_dev_project/features/posts/business/usecase/add_image_to_post.dart';
import 'package:mobile_dev_project/features/posts/business/usecase/add_post.dart';
import 'package:mobile_dev_project/features/posts/data/datasource/remote_data_source.dart';
import 'package:mobile_dev_project/features/posts/data/repositories/add_image_to_post_impl.dart';
import 'package:mobile_dev_project/features/posts/data/repositories/add_post_impl.dart';
import 'package:mobile_dev_project/utils/components/custom_circular_progress_indicator.dart';

class AddPostController extends GetxController {
  TextEditingController postContentController = TextEditingController();

  Rx<File> imageToBeSent = File("").obs;
  var categoryId = 0.obs;

  void setImagePath(String path) {
    imageToBeSent(File(path));
  }

  void setCategoryId(int id) {
    categoryId(id);
  }

  void addPost(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CustomCircularProgressIndicator(),
      ),
    );

    print(
      "Sending post request with content: ${postContentController.text} and categoryId: 2",
    );

    AddPostRepositoryImpl repository = AddPostRepositoryImpl(
      remoteDataSource: PostRemoteDataSourceImpl(dio: Dio()),
      networkInfo: NetworkInfoImpl(
        InternetConnectionChecker(),
      ),
    );

    if (categoryId.value == 0) {
      displayMessageToUser(
        "Please insert a correct category !",
        context,
      );
      return;
    }

    final failureOrPost = await AddPost(repository).call(
      AddPostOptions(
        content: postContentController.text, categoryId: 2,
        //we do not need other options
      ),
    );

    failureOrPost.fold(
      (failure) => {
        Navigator.pop(context),
        displayMessageToUser(
          "An Error happened while adding the post !",
          context,
        ),
        print("=================${failure.errorMessage}"),
        displayMessageToUser("please try again later", context),
      },
      (postId) => {
        // how to handle it if successful
        print("POSSST ID: $postId"),
        imageToBeSent.value.path.length > 1
            ? addImageToPost(context, postId)
            : Get.toNamed("/feed")
      },
    );
  }

  void addImageToPost(BuildContext context, int postId) async {
    AddImageToPostRepository repository = AddImageToPostRepositoryImpl(
      remoteDataSource: PostRemoteDataSourceImpl(dio: Dio()),
      networkInfo: NetworkInfoImpl(
        InternetConnectionChecker(),
      ),
    );

    final failureOrPost = await AddImageToPost(repository).call(
      AddImageToPostOptions(
        postId: postId, image: imageToBeSent.value,
        //we do not need other options
      ),
    );

    failureOrPost.fold(
      (failure) => {
        print("=================${failure.errorMessage}"),
        Navigator.pop(context),
        displayMessageToUser(
          "An Error happened while adding the image of the post !",
          context,
        ),
      },
      (success) => {
        Navigator.pop(context),
        print("SUCCESS: $success"),
        Get.toNamed("/feed"),
      },
    );
  }
}
