import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';
import 'package:mobile_dev_project/features/authentication/components/form_submit_button.dart';
import 'package:mobile_dev_project/features/authentication/components/login_button.dart';
import 'package:mobile_dev_project/features/authentication/components/personal_info_form.dart';
import 'package:mobile_dev_project/features/authentication/components/customized_text.dart';
import 'package:get/get.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
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
          height: 800,
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomizedText(
                textMain: "Personal Information",
                textSecond: "Please enter your information",
              ),
              const PersonalInfoForm(),
              Column(
                children: [
                  FormSubmitButton(
                    title: "Next",
                    color: AppColors.main,
                    textColor: AppColors.white,
                    onTap: () {
                      if (PersonalInfoForm.personalInfoFormKey.currentState!
                          .validate()) {
                        // Get.toNamed('/feed');
                        PersonalInfoForm.personalInfoController
                            .doSignUpPersonalInfo(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fix the errors in the form'),
                          ),
                        );
                      }
                    },
                  ),
                  // Text('OR'),
                  // SubmitButton(
                  //   title: "Sign In with Google",
                  //   color: AppColors.white,
                  //   textColor: AppColors.dark,
                  //   onTap: () {},
                  // )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
