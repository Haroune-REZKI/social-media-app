import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  String title;
  Color color;
  Color textColor;

  LoginButton(
      {super.key,
      required this.title,
      required this.color,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: this.color,
          padding: EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: Colors.black),
          ),
          elevation: 0,
        ),
        child: Text(
          this.title,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: this.textColor),
        ),
      ),
    );
  }
}
