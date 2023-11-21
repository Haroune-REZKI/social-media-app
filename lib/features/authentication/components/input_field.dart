import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';

class InputField extends StatelessWidget {
  String title;
  InputField({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(this.title, style: TextStyle(fontWeight: FontWeight.w100),),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: '',
              enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 2, color: AppColors.main), //<-- SEE HERE
              borderRadius: BorderRadius.circular(30.0), 
              )
            )
          )
              ],),);
  }
}
