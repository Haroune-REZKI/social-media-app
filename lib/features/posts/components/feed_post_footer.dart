import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';

// ignore: must_be_immutable
class PostFooter extends StatefulWidget {
  int likes;
  bool isLiked;
  int comments;
  bool hasBookmarked;
  String timestamps;

  bool isSinglePostView;

  PostFooter({
    super.key,
    required this.likes,
    required this.isLiked,
    required this.comments,
    required this.hasBookmarked,
    required this.timestamps,
    required this.isSinglePostView,
  });

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
                        widget.likes = widget.likes - 1;
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
                        widget.likes = widget.likes + 1;
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
                Text(widget.likes.toString())
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Visibility(
              visible: !widget.isSinglePostView,
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
                  Text(widget.comments.toString()),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
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
              ),
            const SizedBox(
              width: 10,
            ),
            Visibility(
              visible: widget.isSinglePostView,
              child: const Icon(
                Icons.report_gmailerrorred_rounded,
                size: 30,
              ),
            ),
          ],
        ),
        Text(
          widget.isSinglePostView
              ? "Posted Since ${widget.timestamps}"
              : widget.timestamps,
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
