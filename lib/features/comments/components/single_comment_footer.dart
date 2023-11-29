import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';

// ignore: must_be_immutable
class SingleCommentFooter extends StatefulWidget {
  String likes;
  bool isLiked;
  bool hasBookmarked;

  SingleCommentFooter({
    super.key,
    required this.likes,
    required this.isLiked,
    required this.hasBookmarked,
  });

  @override
  State<SingleCommentFooter> createState() => _SingleCommentFooterState();
}

class _SingleCommentFooterState extends State<SingleCommentFooter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
        const Icon(
          Icons.report_gmailerrorred_rounded,
          size: 30,
        ),
      ],
    );
  }
}
