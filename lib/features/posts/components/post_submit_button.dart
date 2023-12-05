import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';

class PostSubmitButton extends StatefulWidget {
  String title;
  Color color;
  Color textColor;
  void Function()? onTap;
  PostSubmitButton({super.key,required this.title,
      required this.color,
      required this.textColor,
      required this.onTap});

  @override
  State<PostSubmitButton> createState() => _PostSubmitButtonState();
}

class _PostSubmitButtonState extends State<PostSubmitButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          widget.onTap;
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.color,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(color: AppColors.light),
          ),
          elevation: 0,
        ),
        child: Text(
          widget.title,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: widget.textColor),
        ),
      ),
    );;
  }
}