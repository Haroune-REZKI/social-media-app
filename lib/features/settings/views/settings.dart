import 'package:flutter/material.dart';
import 'package:mobile_dev_project/features/settings/components/account.dart';
import 'package:mobile_dev_project/features/settings/components/notifications.dart';
import 'package:mobile_dev_project/features/settings/components/other.dart';
import 'package:mobile_dev_project/utils/components/bottom_navigation_bar.dart';

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
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
        title: Center(child: const Text("My Profile")),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),
      body: SingleChildScrollView(
          child: Column(children: [Account(), Notifications(), Other()])),
          bottomNavigationBar: CustomBottomNavigationBar(
            selectedIndex: 0,
          ),
    );
  }
}
