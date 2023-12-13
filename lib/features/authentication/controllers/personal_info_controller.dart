import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gender_picker/source/enums.dart';

class PersonalInfoController extends GetxController {
  TextEditingController fullName = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController phoneNumber = TextEditingController();

  Rx<Gender> selectedGender = Gender.Male.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void selectGender (Gender gender) {selectedGender.value = gender;}
}
