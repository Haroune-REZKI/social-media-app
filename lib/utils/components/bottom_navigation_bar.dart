// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';

// The icons mapping is as follows:
//      -> 0 for Home icon
//      -> 1 for Add icon
//      -> 2 for Profile icon

class NavItems {
  IconData navIcon;
  String routeName;

  NavItems({required this.navIcon, required this.routeName});
}

class CustomBottomNavigationBar extends StatefulWidget {
  int selectedIndex;

  CustomBottomNavigationBar({super.key, required this.selectedIndex});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final List<NavItems> _listOfIcons = [
    NavItems(navIcon: Icons.home_filled, routeName: "/feed"),
    NavItems(navIcon: Icons.add_box, routeName: "/add_post"),
    NavItems(navIcon: Icons.person, routeName: "/profile"),
  ];

  void _handleNavIcon(BuildContext context, int index) {
    Navigator.pushNamed(context, _listOfIcons[index].routeName);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _listOfIcons.map((item) {
          var index = _listOfIcons.indexOf(item);
          return IconButton(
            onPressed: () => _handleNavIcon(context, index),
            icon: Icon(
              item.navIcon,
              color: widget.selectedIndex == index
                  ? AppColors.main
                  : AppColors.mainDark,
              size: 40,
            ),
          );
        }).toList(),
      ),
    ));
  }
}
