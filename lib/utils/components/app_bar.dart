import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/font.config.dart';

class CustomAppBar extends AppBar {
  final BuildContext parentContext;
  CustomAppBar({super.key, required this.parentContext})
      : super(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            automaticallyImplyLeading: true,
            centerTitle: true,
            title: Text("AppName", style: AppTextStyles.title),
            leading: GestureDetector(
              onTap: () {
                      Navigator.pushNamed(parentContext, '/profile');
                    },
              child: Container(
                height: 30,
                width: 30,
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg"),
                  backgroundColor: Colors.red,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 20),
                child: Material(
                  color: Colors.white,
                  child: IconButton(
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(parentContext, '/settings');
                    },
                    splashColor: Colors.black,
                  ),
                ),
              ),
            ]);
}
