import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';

class PostHeader extends StatelessWidget {
  final String? fullName;
  final String? userName;
  final String? avatar;

  const PostHeader(
      {super.key,
      required this.fullName,
      required this.userName,
      required this.avatar});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 70.0,
          child: CircleAvatar(
            radius: 35,
            backgroundColor: AppColors.main,
            child: CircleAvatar(
              radius: 32,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(avatar!),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fullName!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              "@$userName",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: AppColors.light),
            )
          ],
        )
      ],
    );
  }
}
