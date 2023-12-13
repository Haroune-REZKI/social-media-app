import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';
import 'package:mobile_dev_project/features/authentication/components/login_button.dart';
import 'package:mobile_dev_project/features/authentication/components/logo.dart';
import 'package:mobile_dev_project/features/authentication/components/slogan.dart';
import 'package:get/get.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Logo(),
              const Slogan(),
              Column(
                children: [
                  LoginButton(
                    title: "Login",
                    color: AppColors.white,
                    textColor: AppColors.dark,
                    onTap: () {
                      Get.toNamed('/login_page');
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  LoginButton(
                    title: "Sign Up",
                    color: AppColors.main,
                    textColor: AppColors.white,
                    onTap: () {
                      Get.toNamed('/sign_up_page');
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
