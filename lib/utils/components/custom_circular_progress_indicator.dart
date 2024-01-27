import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 30),
      child: Center(
        child: CircularProgressIndicator(
          color: AppColors.main,
        ),
      ),
    );
  }
}
