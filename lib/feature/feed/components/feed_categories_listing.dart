import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';
import 'package:mobile_dev_project/config/font.config.dart';
import 'package:mobile_dev_project/feature/feed/components/feed_single_category.dart';

// ignore: must_be_immutable
class FeedCategoriesListing extends StatefulWidget {
  final List<Map<String, dynamic>> categoryListing = [
    {
      "image": "scientific-clubs.png",
      "title": "Open Days of ENSIA Clubs",
      "category": "Clubs",
      "background": AppColors.yellowSecondaryBG
    },
    {
      "image": "sidi-abdellah-tech-pole.jpg",
      "title": "NHSM Open Days",
      "category": "Pole",
      "background": AppColors.blueSecondaryBG
    },
    {
      "image": "mahelma6.jpg",
      "title": "Water Issues Persisting",
      "category": "Campus",
      "background": AppColors.redSecondaryBG
    },
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
                  title: widget.categoryListing[index]["title"] ?? "",
                  category: widget.categoryListing[index]["category"] ?? "",
                  image: widget.categoryListing[index]["image"] ?? "",
                  bgColor: widget.categoryListing[index]["background"] ??
                      AppColors.blueSecondaryBG,
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
