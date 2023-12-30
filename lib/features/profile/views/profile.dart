import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_dev_project/features/profile/components/profile_details.dart';
import 'package:mobile_dev_project/utils/components/bottom_navigation_bar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back),
        ),
        title: Center(child: const Text("My Profile")),
        actions: [IconButton(onPressed: () {
          Get.toNamed("/settings");
        }, icon: Icon(Icons.settings))],
      ),
      body: SingleChildScrollView(child: ProfileDetails()),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: 0,
      ),
    );
  }
}
