import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_dev_project/features/authentication/components/form_input_field.dart';
import 'package:mobile_dev_project/features/authentication/controllers/sign_in_controller.dart';

class SignInForm extends StatelessWidget {
  static SignInController signInController =
      Get.put<SignInController>(SignInController());
  static final signinFormKey = GlobalKey<FormState>();

  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signinFormKey,
      child: Column(
        children: [
          FormInputField(
            title: 'username',
            controller: signInController.username,
            icon: const Icon(Icons.person),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 40,
          ),
          FormInputField(
            title: 'Password',
            controller: signInController.password,
            icon: const Icon(Icons.lock),
            isPassword: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }

              return null;
            },
          ),
        ],
      ),
    );
  }
}
