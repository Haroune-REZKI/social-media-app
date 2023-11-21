import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';

// ignore: must_be_immutable
class PostFooter extends StatefulWidget {
  String likes;
  bool isLiked;
  String comments;
  bool hasBookmarked;
  String timestamps;

  PostFooter(
      {super.key,
      required this.likes,
      required this.isLiked,
      required this.comments,
      required this.hasBookmarked,
      required this.timestamps});

  @override
  State<PostFooter> createState() => _PostFooterState();
}

class _PostFooterState extends State<PostFooter> {
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
                if (widget.isLiked)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.isLiked = false;
                        widget.likes = (int.parse(widget.likes) - 1).toString();
                      });
                    },
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                if (!widget.isLiked)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.isLiked = true;
                        widget.likes = (int.parse(widget.likes) + 1).toString();
                      });
                    },
                    child: const Icon(
                      Icons.favorite_border,
                      size: 30,
                    ),
                  ),
                const SizedBox(
                  width: 2,
                ),
                Text(widget.likes)
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.comment_outlined,
                  size: 30,
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(widget.comments)
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            if (widget.hasBookmarked)
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.hasBookmarked = false;
                  });
                },
                child: const Icon(
                  Icons.bookmark,
                  color: AppColors.main,
                  size: 30,
                ),
              ),
            if (!widget.hasBookmarked)
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.hasBookmarked = true;
                  });
                },
                child: const Icon(
                  Icons.bookmark_outline,
                  size: 30,
                ),
              )
          ],
        ),
        Text(
          widget.timestamps,
          style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppColors.light),
        )
      ],
    );
  }
}
