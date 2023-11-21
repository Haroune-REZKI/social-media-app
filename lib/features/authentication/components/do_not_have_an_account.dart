import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';

class DoNotHaveAnAccount extends StatelessWidget {
  const DoNotHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 15, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Do not have an account? "),
          Text(
            "Sign up",
            style: TextStyle(
                color: AppColors.main, decoration: TextDecoration.underline),
          )
        ],
      ),
    ));
  }
}
