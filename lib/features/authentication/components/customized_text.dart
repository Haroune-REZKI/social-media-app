import 'package:flutter/material.dart';

class SigninText extends StatelessWidget {
  String textMain;
  String textSecond;


  SigninText({super.key, required this.textMain, required this.textSecond,});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(
          textMain,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          textSecond,
          style: TextStyle(fontWeight: FontWeight.w300),
        )
      ]),
    );
  }
}
