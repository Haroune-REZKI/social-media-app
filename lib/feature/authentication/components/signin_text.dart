import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child: Column(children: [Text("Sign In", style: TextStyle(fontWeight: FontWeight.bold),), Text("Please enter your information", style: TextStyle(fontWeight: FontWeight.w100),)]),);
  }
}