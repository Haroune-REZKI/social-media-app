import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';
import 'package:mobile_dev_project/features/authentication/components/already_user.dart';
import 'package:mobile_dev_project/features/authentication/components/form_submit_button.dart';
import 'package:mobile_dev_project/features/authentication/components/login_button.dart';
import 'package:mobile_dev_project/features/authentication/components/customized_text.dart';
import 'package:mobile_dev_project/features/authentication/components/sign_up_form.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
      final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print('Error signing in with Google: $error');
    }
  }
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
            height: screenHeight * 0.95,
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomizedText(
                    textMain: "Sign Up", textSecond: "Create your Account"),
                SignUpForm(),
                Column(
                  children: [
                    FormSubmitButton(
                      title: "Sign Up",
                      color: AppColors.main,
                      textColor: AppColors.white,
                      onTap: () {
                        if (SignUpForm.signupFormKey.currentState!.validate()) {
                          SignUpForm.signUpController.doSignUp(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('Please fix the errors in the form'),
                            ),
                          );
                        }
                      },
                    ),
                    // Text('OR'),
                    // SubmitButton(
                    //     title: "Sign In with Google",
                    //     color: AppColors.white,
                    //     textColor: AppColors.dark,
                    //     onTap: () {}),
                    const AlreadyHaveAnAccount(),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
