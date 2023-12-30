import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobile_dev_project/config/colors.config.dart';
import 'package:mobile_dev_project/features/authentication/components/authentification_controllers.dart';

class FormInputField extends StatelessWidget {
  String title;
  final Icon? icon;
  final String? Function(String?)? validator;
  final bool? obsecureTextValue;
  final TextInputType keyboardType; 
  final bool isPassword; //used to check the length of the password & to hide it(passed as boolean in obsecure text)
  TextEditingController controller = TextEditingController();

  FormInputField({
    super.key,
    required this.title,
    required this.controller,
    Icon? this.icon,
    required this.validator,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.obsecureTextValue = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: icon,
          hintText: title,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.main),
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        validator: validator,
        obscureText: isPassword,
        keyboardType: keyboardType,
      ),
    );
  }
}
