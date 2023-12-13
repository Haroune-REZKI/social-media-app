import 'package:flutter/material.dart';
import 'package:mobile_dev_project/features/settings/components/account.dart';
import 'package:mobile_dev_project/features/settings/components/notifications.dart';
import 'package:mobile_dev_project/features/settings/components/other.dart';
import 'package:mobile_dev_project/utils/components/bottom_navigation_bar.dart';
import 'package:get/get.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
        title: const Center(
          child: Text("My Profile"),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Account(),
            Notifications(),
            Other(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: 2,
      ),
    );
  }
}
