import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';
import 'package:mobile_dev_project/feature/authentication/components/login_button.dart';
import 'package:mobile_dev_project/feature/authentication/components/logo.dart';
import 'package:mobile_dev_project/feature/authentication/components/slogan.dart';

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
          margin: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Logo(),
              Slogan(),
              LoginButton(title: "Login", color: AppColors.white, textColor: AppColors.dark,),
              LoginButton(title: "Signup", color: AppColors.main, textColor: AppColors.white,)

            ],
          ),
        ),
      ),
    );
  }
}
