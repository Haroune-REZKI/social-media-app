import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_dev_project/features/authentication/components/form_input_field.dart';
import 'package:mobile_dev_project/features/authentication/components/form_submit_button.dart';
import 'package:mobile_dev_project/features/authentication/controllers/sign_in_controller.dart';

class SignInForm extends StatelessWidget {
  SignInController signInController = Get.put<SignInController>(SignInController());
  static final signinFormKey = GlobalKey<FormState>();

  SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
          key: signinFormKey,
          child: Column(
            children: [
              FormInputField(
                title: 'username',
                controller: signInController.username,
                icon: Icon(Icons.person),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 40,
              ),
              FormInputField(
                title: 'Password',
                controller: signInController.password,
                icon: Icon(Icons.lock),
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }

                  return null;
                },
              ),
            ],
          )),
    );
  }
}
