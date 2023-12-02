import 'package:flutter/material.dart';
import 'package:mobile_dev_project/features/authentication/components/form_input_field.dart';

class SignUpForm extends StatefulWidget {

  SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SIgnUpFormState();
}

class _SIgnUpFormState extends State<SignUpForm> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormInputField(
              title: "Username",
              controller: usernameController,
              icon: Icon(Icons.person),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormInputField(
                title: "Passsword",
                controller: passwordController,
                icon: const Icon(Icons.lock)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormInputField(
                title: "Confirm Passsword",
                controller: passwordController,
                icon: const Icon(Icons.lock)),
          ),
        ],
      )),
    );;
  }
}