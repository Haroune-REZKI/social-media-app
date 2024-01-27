import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_dev_project/features/profile/components/profile_details.dart';
import 'package:mobile_dev_project/features/profile/controller/get_profile.dart';
import 'package:mobile_dev_project/utils/components/bottom_navigation_bar.dart';

class Profile extends StatelessWidget {
  Profile({super.key})
  {
    print("Profile controller will be initializes");
    Profilecontroller = Get.put(UserProfileController());
    print(">>>>>>>>>>>>>> profile controller is invoked ---------");
  }

  late final UserProfileController Profilecontroller;
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
      body: Profilecontroller.obx(
        (state) => 
          SingleChildScrollView(child: ProfileDetails(user: state!))
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: 0,
      ),
    );
  }
}
