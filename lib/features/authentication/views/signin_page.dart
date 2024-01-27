import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';
import 'package:mobile_dev_project/features/authentication/components/do_not_have_an_account.dart';
import 'package:mobile_dev_project/features/authentication/components/forgot_password.dart';
import 'package:mobile_dev_project/features/authentication/components/form_submit_button.dart';
import 'package:mobile_dev_project/features/authentication/components/sign_in_form.dart';
import 'package:mobile_dev_project/features/authentication/components/customized_text.dart';
import 'package:get/get.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back),
        ),
        title: const Text("AppName"),
      ),

      body: SingleChildScrollView(
        child: Container(
          height: screenHeight * 0.85,
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CustomizedText(
                      textMain: "Welcome Back",
                      textSecond: "Enter your credential to login",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SignInForm(),
                    const ForgetPassword(),
                  ],
                ),
                Column(
                  children: [
                    FormSubmitButton(
                      title: "Log In",
                      color: AppColors.main,
                      textColor: AppColors.white,
                      onTap: () {
                        if (SignInForm.signinFormKey.currentState!.validate()) {
                          // Get.toNamed('/feed');
        
                          print(
                              "USERNAME: ${SignInForm.signInController.username.value.text}");
                          print(
                              "PASSWORD: ${SignInForm.signInController.password.value.text}");
        
                          SignInForm.signInController.doLogin(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please fix the errors in the form'),
                            ),
                          );
                        }
                      },
                    ),
                    const DoNotHaveAnAccount(),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
