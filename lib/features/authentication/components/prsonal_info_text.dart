import 'package:flutter/material.dart';

class PersonalInfoText extends StatelessWidget {
  const PersonalInfoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Personal Information', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          Text('Please enter your information', style: TextStyle(fontWeight: FontWeight.w300),)
        ],
      ),
    );
  }
}
