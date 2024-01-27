import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';

class PostTextField extends StatefulWidget {
  String title;
  TextEditingController controller = TextEditingController();
  PostTextField({super.key, required this.title, required this.controller});

  @override
  State<PostTextField> createState() => _PostTextFieldState();
}

class _PostTextFieldState extends State<PostTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        textAlign: TextAlign.start,
        controller: widget.controller,
        minLines: 10,
        maxLines: 100,
        decoration: InputDecoration(
          hintText: widget.title,
          alignLabelWithHint: true,
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
    );
    ;
  }
}
