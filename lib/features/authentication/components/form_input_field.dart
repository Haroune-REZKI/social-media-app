import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobile_dev_project/config/colors.config.dart';
import 'package:mobile_dev_project/features/authentication/components/authentification_controllers.dart';

class FormInputField extends StatelessWidget {
  String title;
   TextEditingController controller =
      TextEditingController();
  FormInputField({super.key, required this.title, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: title,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: AppColors.main),
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
      ],
    );
  }
}
