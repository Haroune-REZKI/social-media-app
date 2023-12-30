import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_dev_project/config/colors.config.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 15, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Already a user? "),
          GestureDetector(
            onTap: () {
              Get.toNamed('/login_page');
            },
            child: Text(
              "Login",
              style: TextStyle(
                  color: AppColors.main, decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    ));
  }
}
