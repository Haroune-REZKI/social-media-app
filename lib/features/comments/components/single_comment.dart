import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';
import 'package:mobile_dev_project/config/font.config.dart';
import 'package:mobile_dev_project/features/comments/business/entities/comment.dart';
import 'package:mobile_dev_project/features/comments/components/single_comment_footer.dart';
import 'package:mobile_dev_project/features/comments/handlers/constants/main.dart';

class SingleComment extends StatelessWidget {
  final Comment comment;

  const SingleComment({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /* Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 70.0,
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: AppColors.main,
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          commentsExample[commentId].avatar,
                        ),
                      ),
                    ),
                  ),
                ) */
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: 150),
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comment.author.fullname,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "@${comment.author.username}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.light,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    comment.content,
                    style: AppTextStyles.text,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleCommentFooter(
                    likes: "0",
                    isLiked: commentsExample[0].isLiked,
                    hasBookmarked: commentsExample[0].hasBookmarked,
                  ), 
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 15,
            right: 10,
          ),
          child: Text(
            comment.createdAt,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppColors.light,
            ),
          ),
        )
      ],
    );
  }
}
