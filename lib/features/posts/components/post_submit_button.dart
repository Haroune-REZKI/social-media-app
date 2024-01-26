import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';

class PostSubmitButton extends StatelessWidget {
  String title;
  Color color;
  Color textColor;
  void Function()? onTap;
  PostSubmitButton({super.key,required this.title,
      required this.color,
      required this.textColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(color: AppColors.light),
          ),
          elevation: 0,
        ),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
        ),
      ),
    );;
  }
}