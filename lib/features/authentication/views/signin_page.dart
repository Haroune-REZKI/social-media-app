import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';
import 'package:mobile_dev_project/features/authentication/components/do_not_have_an_account.dart';
import 'package:mobile_dev_project/features/authentication/components/forgot_password.dart';
import 'package:mobile_dev_project/features/authentication/components/input_field.dart';
import 'package:mobile_dev_project/features/authentication/components/login_button.dart';
import 'package:mobile_dev_project/features/authentication/components/signin_text.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text("AppName"),
      ),
      body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    SigninText(),
                    InputField(title: "username"),
                    InputField(title: "Password"),
                    ForgetPassword(),
                  ],
                ),
              ),
              Container(
                child: Column(children: [
                  LoginButton(title: "Log In", color: AppColors.main, textColor: AppColors.white),
                  DoNotHaveAnAccount(),
                ],),)
            ],
          )),
    );
  }
}
