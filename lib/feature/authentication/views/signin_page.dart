import 'package:flutter/material.dart';
import 'package:mobile_dev_project/feature/authentication/components/input_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AppName"),),
      body: Column(children: [
        SignIn(),
      ],),
    );
  }
}