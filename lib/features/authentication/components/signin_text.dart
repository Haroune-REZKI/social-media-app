import 'package:flutter/material.dart';

class SigninText extends StatelessWidget {
  const SigninText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children:
     [Text("Sign In", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
     Text("Please enter your information", style: TextStyle(fontWeight: FontWeight.w300),)]),);
  }
}