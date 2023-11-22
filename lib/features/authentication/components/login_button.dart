import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';

class LoginButton extends StatelessWidget {
  String title;
  Color color;
  Color textColor;
  void Function()? onTap;

  LoginButton(
      {super.key,
      required this.title,
      required this.color,
      required this.textColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 30),
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
    );
  }
}
