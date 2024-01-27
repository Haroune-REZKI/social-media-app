import 'package:flutter/material.dart';

class CustomizedText extends StatelessWidget {
  String textMain;
  String textSecond;

  CustomizedText({
    super.key,
    required this.textMain,
    required this.textSecond,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(
          textMain,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          textSecond,
          style: const TextStyle(fontWeight: FontWeight.w300),
        )
      ]),
    );
  }
}
