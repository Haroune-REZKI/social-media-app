import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/font.config.dart';

class PostContent extends StatelessWidget {
  final String content;
  final bool hasImage;
  final String? image;

  const PostContent(
      {super.key,
      required this.content,
      required this.hasImage,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            content,
            style: AppTextStyles.text,
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        if (image != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image?.trim() ?? ""),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
