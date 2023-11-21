import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';
import 'package:mobile_dev_project/config/font.config.dart';
import 'package:mobile_dev_project/features/categories/handlers/classes/Category.dart';
import 'package:mobile_dev_project/features/feed/components/feed_single_category.dart';

// ignore: must_be_immutable
class FeedCategoriesListing extends StatefulWidget {
  final List<Category> categoryListing = [
    Category(
      id: -1,
      category: "Clubs",
      title: "Open Days of ENSIA Clubs",
      description:
          "Clubs Category: Catch all the news related to the Techno Pole’s Clubs !",
      bgImage: "scientific-clubs.png",
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
      bgImage: "sidi-abdellah-tech-pole.jpg",
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
      bgImage: "mahelma6.jpg",
      mainColor: AppColors.redSecondary,
      bgColor: AppColors.redSecondaryBG,
      isSubscribed: Random().nextBool(),
    ),
  ];

  FeedCategoriesListing({super.key});

  @override
  State<FeedCategoriesListing> createState() => _FeedCategoriesListingState();
}

class _FeedCategoriesListingState extends State<FeedCategoriesListing> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Trending Today",
          style: AppTextStyles.title,
        ),
        SizedBox(
          height: 250,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(12),
            itemCount: 5,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 20);
            },
            itemBuilder: (context, index) {
              if (index < widget.categoryListing.length) {
                return FeedSingleCategory(
                  categoryData: widget.categoryListing[index],
                );
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
