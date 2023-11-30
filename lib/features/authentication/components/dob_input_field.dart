import 'package:dob_input_field/dob_input_field.dart';
import 'package:flutter/material.dart';

class DobInputField extends StatelessWidget {
  const DobInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DOBInputField(
              firstDate: DateTime(1900),
              lastDate:DateTime.now() ,
              showLabel: true,
              autovalidateMode: AutovalidateMode.always,
              fieldLabelText: "With label",
            ),
    );
  }
}