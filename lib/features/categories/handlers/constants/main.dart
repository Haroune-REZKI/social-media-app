import 'dart:math';

import 'package:mobile_dev_project/config/colors.config.dart';
import 'package:mobile_dev_project/features/categories/handlers/classes/category.dart';

List<Category> categoriesExample = [
  Category(
    id: -1,
    category: "Clubs",
    title: "Open Days of ENSIA Clubs",
    description:
        "Clubs Category: Catch all the news related to the Techno Pole’s Clubs !",
    bgImage: "assets/scientific-clubs.png",
    mainColor: AppColors.yellowSecondary,
    bgColor: AppColors.yellowSecondaryBG,
    isSubscribed: Random().nextBool(),
  ),
  Category(
    id: -1,
    category: "Pole",
    title: "NHSM Open Days",
    description:
        "Pole Category: Catch all the news related to the Technical Pole !",
    bgImage: "assets/sidi-abdellah-tech-pole.jpg",
    mainColor: AppColors.blueSecondary,
    bgColor: AppColors.blueSecondaryBG,
    isSubscribed: Random().nextBool(),
  ),
  Category(
    id: -1,
    category: "Campus",
    title: "Water Issues Persisting",
    description:
        "Residency Category: Catch all the news related to the Residencies !",
    bgImage: "assets/mahelma6.jpg",
    mainColor: AppColors.redSecondary,
    bgColor: AppColors.redSecondaryBG,
    isSubscribed: Random().nextBool(),
  ),
];
