import 'package:flutter/material.dart';
import 'package:mobile_dev_project/features/authentication/components/form_input_field.dart';
import 'package:mobile_dev_project/features/authentication/components/form_submit_button.dart';

class SignInForm extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                controller: usernameController,
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
                controller: passwordController,
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
