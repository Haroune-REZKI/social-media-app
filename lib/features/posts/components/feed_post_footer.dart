import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_dev_project/config/colors.config.dart';
import 'package:mobile_dev_project/features/posts/controllers/bookmark_unbookmark.dart';
import 'package:mobile_dev_project/features/posts/controllers/like_unlike_controller.dart';

// ignore: must_be_immutable
class PostFooter extends StatelessWidget {
  int postId;
  int likes;
  bool isLiked;
  int comments;
  bool hasBookmarked;
  String timestamps;

  bool isSinglePostView;

  late final LikeUnlikeController likeUnlikeController;
  late final BookmarkUnbookmarkController bookmarkUnbookmarkController;

  PostFooter({
    super.key,
    required this.postId,
    required this.likes,
    required this.isLiked,
    required this.comments,
    required this.hasBookmarked,
    required this.timestamps,
    required this.isSinglePostView,
  }) {
    likeUnlikeController = Get.put(
      LikeUnlikeController(
        postId_: postId,
        liked_: isLiked,
        likes_: likes,
      ),
      tag: "$postId",
    );

    bookmarkUnbookmarkController = Get.put(
      BookmarkUnbookmarkController(
        postId_: postId,
        bookmarked_: hasBookmarked,
      ),
      tag: "$postId",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      if (!likeUnlikeController.liked.value) {
                        likeUnlikeController.doLike();
                      } else {
                        likeUnlikeController.doUnLike();
                      }
                    },
                    child: likeUnlikeController.liked.value
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 30,
                          )
                        : const Icon(
                            Icons.favorite_border,
                            size: 30,
                          ),
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                Obx(() => Text(likeUnlikeController.likes.value.toString()))
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Visibility(
              visible: !isSinglePostView,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.comment_outlined,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(comments.toString()),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            Obx(
              () => GestureDetector(
                onTap: () {
                  if (!bookmarkUnbookmarkController.bookmarked.value) {
                    bookmarkUnbookmarkController.doBookmark();
                  } else {
                    bookmarkUnbookmarkController.doUnBookmark();
                  }
                },
                child: bookmarkUnbookmarkController.bookmarked.value
                    ? const Icon(
                        Icons.bookmark,
                        color: AppColors.main,
                        size: 30,
                      )
                    : const Icon(
                        Icons.bookmark_outline,
                        size: 30,
                      ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Visibility(
              visible: isSinglePostView,
              child: const Icon(
                Icons.report_gmailerrorred_rounded,
                size: 30,
              ),
            ),
          ],
        ),
        Text(
          isSinglePostView ? "Posted $timestamps" : timestamps,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: AppColors.light,
          ),
        ),
      ],
    );
  }
}
