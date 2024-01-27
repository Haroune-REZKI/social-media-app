import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_dev_project/config/colors.config.dart';
import 'package:mobile_dev_project/config/font.config.dart';

class CustomAppBar extends AppBar {
  final BuildContext parentContext;
  final pageTitle;
  CustomAppBar({super.key, required this.parentContext, required this.pageTitle})
      : super(
          backgroundColor: AppColors.white,
          surfaceTintColor: Colors.white,
          elevation: 0.0,
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: Text(pageTitle, style: AppTextStyles.title),
          leading: GestureDetector(
            onTap: () {
              Get.toNamed('/profile');
            },
            child: Container(
              height: 30,
              width: 30,
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg",
                ),
                backgroundColor: Colors.red,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 20),
              child: Material(
                color: AppColors.white,
                child: IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Get.toNamed('/settings');
                  },
                  splashColor: Colors.black,
                ),
              ),
            ),
          ],
        );
}
