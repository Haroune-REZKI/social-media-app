import 'package:flutter/material.dart';
import 'package:mobile_dev_project/features/authentication/components/form_input_field.dart';
import 'package:mobile_dev_project/features/authentication/components/form_submit_button.dart';
import 'package:mobile_dev_project/features/authentication/components/input_field.dart';

class SignInForm extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  static final formKey = GlobalKey<FormState>();

  SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: formKey,
      child: Form(
          child: Column(
        children: [
          FormInputField(title: 'username', controller: usernameController,),
          SizedBox(
            height: 40,
          ),
          FormInputField(title: 'Password', controller: passwordController,),
        ],
      )),
    );
  }
}
