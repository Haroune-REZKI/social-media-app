import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobile_dev_project/config/colors.config.dart';
import 'package:mobile_dev_project/features/authentication/components/customized_text.dart';
import 'package:mobile_dev_project/features/authentication/components/do_not_have_an_account.dart';
import 'package:mobile_dev_project/features/authentication/components/form_input_field.dart';
import 'package:mobile_dev_project/features/authentication/components/form_submit_button.dart';
import 'package:mobile_dev_project/features/authentication/components/login_button.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final FormKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmedPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                CustomizedText(
                    textMain: "ResetPassword",
                    textSecond: "Enter your new password"),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: FormKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FormInputField(
                                title: "Passsword",
                                controller: passwordController,
                                isPassword: true,
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
                                
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FormInputField(
                                title: "Confirm Passsword",
                                controller: confirmedPasswordController,
                                isPassword: true,
                                icon: const Icon(Icons.lock),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please confirm the password';
                                  }
                                  // Check if the password matches the confirmation
                                  if (value != passwordController.text) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                    ),
                    FormSubmitButton(
                        title: "Reset Password",
                        color: AppColors.main,
                        textColor: AppColors.white,
                        onTap: () {
                          
                          if (FormKey.currentState!.validate()) {
                            Get.toNamed('/feed');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Please fix the errors in the form')),
                            );
                          }
                        }),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                ),
                Container(child: DoNotHaveAnAccount()),
              ],
            ),
          ),
        ));
  }
}
