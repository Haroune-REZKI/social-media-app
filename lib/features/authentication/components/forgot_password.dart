import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(alignment: Alignment.bottomRight,
     child: const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text("Forgot Password?", style: TextStyle(fontWeight: FontWeight.w100, color: AppColors.main, decoration: TextDecoration.underline),),
    ),);
  }
}