import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';
import 'package:mobile_dev_project/config/font.config.dart';
import 'package:mobile_dev_project/features/comments/components/adding_comment_section.dart';
import 'package:mobile_dev_project/features/comments/components/single_comment.dart';
import 'package:mobile_dev_project/features/comments/controllers/list_of_controllers.dart';
import 'package:mobile_dev_project/features/comments/handlers/constants/main.dart';
import 'package:mobile_dev_project/features/posts/components/feed_post.dart';
import 'package:mobile_dev_project/features/posts/controllers/single_post.dart';
import 'package:mobile_dev_project/utils/components/bottom_navigation_bar.dart';
import 'package:get/get.dart';

class SinglePost extends StatelessWidget {
  final int postId;

  // late final ListOfCommentsController listOfCommentsController;

  SinglePost({super.key, required this.postId}){
    singlePostController = Get.put(SinglePostController(postId: postId));
  }

  late final SinglePostController singlePostController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
        ),
        title: const Text(
          "Single Post",
          style: TextStyle(
            fontSize: 26,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: singlePostController.obx((state) => ListView.builder(
            itemBuilder: (context, index) {
              FeedPost(
                postContent: state!,
                isSinglePostView: true,
              );
              const SizedBox(
                height: 10,
              );
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Browse Comments",
                  style: AppTextStyles.subtitle,
                ),
              );
              const SizedBox(
                height: 10,
              );
              for (var comment in state!.comments)
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30.0,
                    right: 30.0,
                    bottom: 20.0,
                  ),
                  child: SingleComment(commentId: comment.id),
                );
            },
          )),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AddingCommentSection(
            commentId: commentsExample[0].id,
            postId: this.postId,
            // listOfCommentsController: widget.listOfCommentsController,
          ),
          CustomBottomNavigationBar(
            selectedIndex: 0,
          ),
        ],
      ),
    );
  }
}
