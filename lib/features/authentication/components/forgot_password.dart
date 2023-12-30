import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_dev_project/config/colors.config.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Get.toNamed('/forgot_password');
            },
            child: Text(
            "Forgot Password?",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColors.main,
              decoration: TextDecoration.underline,
            ),
          ),
        )));
  
  }
}
