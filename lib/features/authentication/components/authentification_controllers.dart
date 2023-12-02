import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  var username = "".obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}
  @override
  void onClose() {}

  void setUsername(dynamic controllerUsername) {
    this.username = controllerUsername;
  }
}
