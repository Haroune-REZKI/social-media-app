import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/font.config.dart';

class PostContent extends StatelessWidget {
  final String content;
  final bool hasImage;

  const PostContent({super.key, required this.content, required this.hasImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          content,
          style: AppTextStyles.text,
        ),
        const SizedBox(
          height: 15,
        ),
        if (hasImage)
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("mahelma6.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
