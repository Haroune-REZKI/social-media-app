import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobile_dev_project/core/connection/network_info.dart';
import 'package:mobile_dev_project/features/authentication/data/datasource/local_data_source.dart';
import 'package:mobile_dev_project/features/comments/business/entities/comment.dart';
import 'package:mobile_dev_project/features/comments/business/repositories/add_comment_repository.dart';
import 'package:mobile_dev_project/features/comments/business/usecases/add_comment.dart';
import 'package:mobile_dev_project/features/comments/controllers/list_of_controllers.dart';
import 'package:mobile_dev_project/features/comments/data/datasource/remote_data_source.dart';
import 'package:mobile_dev_project/features/comments/data/repositories/add_comment.dart';
import 'package:mobile_dev_project/utils/components/custom_circular_progress_indicator.dart';
import 'package:mobile_dev_project/features/authentication/controllers/handlers.dart';

class AddCommentController extends GetxController {
  int postId;
  TextEditingController content = TextEditingController();
  ListOfCommentsController listOfCommentsController;

  var isError = false.obs;

  AddCommentController({
    required this.postId,
    required this.listOfCommentsController,
  });

  void addComment(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CustomCircularProgressIndicator(),
      ),
    );

    AddCommentRepositoryImpl repository = AddCommentRepositoryImpl(
      remoteDataSource: CommentRemoteDataSourceImpl(dio: Dio()),
      networkInfo: NetworkInfoImpl(
        InternetConnectionChecker(),
      ),
    );

    final failureOrSuccess = await AddComment(repository).call(
      AddCommentOptions(
        content: content.value.text,
        postId: postId,
      ),
    );

    final user = await UserLocalDataSource.retrieveUserFromLocalCache();

    print("USER: ${user.toString()}");

    failureOrSuccess.fold(
      (failure) => {
        Navigator.pop(context),
        displayMessageToUser(
          "Please Verify the validity of your Comment then Retry !",
          context,
        )
      },
      (success) => {
        Navigator.of(context, rootNavigator: true).pop(),
        listOfCommentsController.listOfComments.add(
          Comment(
            id: 0,
            userId: user != null ? user.id : 0,
            postId: -1,
            content: content.value.text,
            createdAt: "moments ago",
            author: user!,
          ),
        ),
        content.text = "",
      },
    );
  }
}
