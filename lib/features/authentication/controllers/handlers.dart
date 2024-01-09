import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/font.config.dart';

void displayMessageToUser(String message, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        message,
        style: AppTextStyles.title,
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); //close Dialog
          },
          child: Text(
            'Close',
            style: AppTextStyles.text,
          ),
        )
      ],
    ),
  );
}
