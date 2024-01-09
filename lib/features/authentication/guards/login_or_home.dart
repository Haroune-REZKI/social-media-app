import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_dev_project/features/authentication/controllers/auth_switcher.dart';
import 'package:mobile_dev_project/features/authentication/views/welcome_page.dart';
import 'package:mobile_dev_project/features/feed/views/home_page.dart';
import 'package:mobile_dev_project/utils/components/custom_circular_progress_indicator.dart';

class AuthPageSwitcher extends StatelessWidget {
  AuthPageSwitcher({super.key});

  final AuthSwitcherController authController =
      Get.put(AuthSwitcherController());

  @override
  Widget build(BuildContext context) {
    return authController.obx(
      (state) => Container(
        child: state != null ? const HomeFeed() : const WelcomePage(),
      ),
      onError: (e) => const WelcomePage(),
      onLoading: const CustomCircularProgressIndicator(),
    );
  }
}
