import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';
import 'package:mobile_dev_project/features/comments/handlers/constants/main.dart';

class AddingCommentSection extends StatefulWidget {
  final int commentId;
  const AddingCommentSection({super.key, required this.commentId});

  @override
  State<AddingCommentSection> createState() => _AddingCommentSectionState();
}

class _AddingCommentSectionState extends State<AddingCommentSection> {
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
                commentsExample[widget.commentId].avatar, // TODO: To be changed
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: TextField(
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
                  suffixIcon: const Icon(
                    Icons.send,
                    size: 30,
                    color: AppColors.main,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
