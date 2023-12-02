import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';

class GenderSelector extends StatelessWidget {
  const GenderSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return _genderWidget(false, false);
  }

  Widget _genderWidget(bool _showOther, bool _alignment) {
    return Container(
      alignment: Alignment.center,
      child: GenderPickerWithImage(
        showOtherGender: _showOther,
        verticalAlignedText: _alignment,
        onChanged: (Gender? gender) {
          print(gender);
        },
        selectedGender: Gender.Male, //By Default
        selectedGenderTextStyle:
            TextStyle(color: Color(0xFFC41A3B), fontWeight: FontWeight.bold),
        unSelectedGenderTextStyle:
            TextStyle(color: Color(0xFF1B1F32), fontWeight: FontWeight.bold),
        equallyAligned: true,
        size: 40.0, // default size 40.0
        animationDuration: Duration(seconds: 1),
        isCircular: true, // by default true
        opacityOfGradient: 0.5,
        padding: EdgeInsets.all(8.0),
      ),
    );
  }
}
