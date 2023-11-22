import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/font.config.dart';
import 'package:mobile_dev_project/features/categories/handlers/constants/main.dart';
import 'package:mobile_dev_project/features/feed/components/feed_single_category.dart';

// ignore: must_be_immutable
class FeedCategoriesListing extends StatefulWidget {
  final categoryListing = categoriesExample;

  FeedCategoriesListing({super.key});

  @override
  State<FeedCategoriesListing> createState() => _FeedCategoriesListingState();
}

class _FeedCategoriesListingState extends State<FeedCategoriesListing> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Trending Today",
            style: AppTextStyles.title,
          ),
          SizedBox(
            height: 270,
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
      ),
    );
  }
}
