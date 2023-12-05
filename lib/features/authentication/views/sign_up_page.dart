import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';
import 'package:mobile_dev_project/features/authentication/components/form_submit_button.dart';
import 'package:mobile_dev_project/features/authentication/components/input_field.dart';
import 'package:mobile_dev_project/features/authentication/components/login_button.dart';
import 'package:mobile_dev_project/features/authentication/components/personal_info_form.dart';
import 'package:mobile_dev_project/features/authentication/components/customized_text.dart';
import 'package:mobile_dev_project/features/authentication/components/sign_up_form.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
          title: const Text("AppName"),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: screenHeight * 0.95,
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              
              children: [
                CustomizedText(textMain: "Sign Up", textSecond: "Create your Account"),
                SignUpForm(),
                Container(
                  child: Column(
                    children: [
                      FormSubmitButton(
                          title: "Sign Up",
                          color: AppColors.main,
                          textColor: AppColors.white,
                          onTap: () {
                            Navigator.pushNamed(context, "login_page");
                          }),
                      Text('OR'),
                      LoginButton(
                          title: "Sign In with Google",
                          color: AppColors.white,
                          textColor: AppColors.dark,
                          onTap: () {})
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
