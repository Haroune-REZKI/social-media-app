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

class EmailSent extends StatefulWidget {
  const EmailSent({super.key});

  @override
  State<EmailSent> createState() => _EmailSentState();
}

class _EmailSentState extends State<EmailSent> {
  final FormKey = GlobalKey<FormState>();
  TextEditingController codeController = TextEditingController();

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
                    textMain: "Email Sent",
                    textSecond: "Enter your confirmation code"),
                Column(
                  children: [
                    Form(
                      key: FormKey,
                      child: FormInputField(
                        title: 'Confirmation Code',
                        controller: codeController,
                        icon: Icon(Icons.code),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a confirmation code';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                    ),
                    FormSubmitButton(
                        title: "Confirm",
                        color: AppColors.main,
                        textColor: AppColors.white,
                        onTap: () {
                          if (FormKey.currentState!.validate()) {
                            Get.toNamed('/reset_password');
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
                  height: MediaQuery.of(context).size.height * 0.45,
                ),
                Container(child: DoNotHaveAnAccount()),
              ],
            ),
          ),
        ));
  }
}
