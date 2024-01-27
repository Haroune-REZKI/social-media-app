import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_dev_project/config/colors.config.dart';
import 'package:mobile_dev_project/features/comments/controllers/add_comment_controller.dart';
import 'package:mobile_dev_project/features/comments/controllers/list_of_controllers.dart';
import 'package:mobile_dev_project/features/comments/handlers/constants/main.dart';

class AddingCommentSection extends StatelessWidget {
  final int commentId;
  final int postId;

  final ListOfCommentsController listOfCommentsController;
  late final AddCommentController addCommentController;

  AddingCommentSection({
    super.key,
    required this.commentId,
    required this.postId,
    required this.listOfCommentsController,
  }) {
    addCommentController = Get.put(AddCommentController(
      postId: postId,
      listOfCommentsController: listOfCommentsController,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.0,
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                commentsExample[commentId].avatar, // TODO: To be changed
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: TextField(
              controller: addCommentController.content,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 0.0,
                  ),
                ),
                border: const OutlineInputBorder(),
                hintText: "What do you think ?",
                hintStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 0.0,
                  ),
                ),
                filled: true,
                fillColor: const Color.fromARGB(255, 231, 236, 240),
                suffixIcon: GestureDetector(
                  onTap: () {
                    if (addCommentController.content.text.length < 10) {
                      addCommentController.isError.value = true;
                    } else {
                      addCommentController.addComment(context);
                    }
                  },
                  child: const Icon(
                    Icons.send,
                    size: 30,
                    color: AppColors.main,
                  ),
                ),
                errorText: addCommentController.isError.value
                    ? "Please Enter at least 10 characters"
                    : null,
              ),
            ),
          )
        ],
      ),
    );
  }
}
