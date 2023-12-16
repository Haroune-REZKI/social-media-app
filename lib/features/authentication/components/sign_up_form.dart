import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_dev_project/features/authentication/components/form_input_field.dart';
import 'package:mobile_dev_project/features/authentication/controllers/sign_up_controller.dart';

class SignUpForm extends StatefulWidget {
  static final signupFormKey = GlobalKey<FormState>();
  SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SIgnUpFormState();
}

class _SIgnUpFormState extends State<SignUpForm> {
  SignUpController signUpController = Get.put<SignUpController>(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: SignUpForm.signupFormKey,
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormInputField(
              title: "Username",
              controller: signUpController.username,
              icon: Icon(Icons.person),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a username';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormInputField(
              title: "Passsword",
              controller: signUpController.password,
              icon: const Icon(Icons.lock),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                // Password validation logic
                if (value.length < 8) {
                  return 'Password must be at least 8 characters long';
                  //to be reviewed: add more logic if needed
                }
                return null;
              },
              isPassword: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormInputField(
              title: "Confirm Passsword",
              controller: signUpController.confirmPassword,
              icon: const Icon(Icons.lock),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm the password';
                }
                // Check if the password matches the confirmation
                if (value != signUpController.password.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
              isPassword: true,
            ),
          ),
        ],
      )),
    );
    ;
  }
}
