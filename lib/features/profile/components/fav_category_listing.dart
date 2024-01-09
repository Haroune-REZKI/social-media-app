import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/font.config.dart';
import 'package:mobile_dev_project/features/categories/handlers/constants/main.dart';
import 'package:mobile_dev_project/features/feed/components/feed_single_category.dart';
import 'package:mobile_dev_project/features/profile/components/fav_single_category.dart';

// ignore: must_be_immutable
class FavCategoryListing extends StatefulWidget {
  final categoryListing = categoriesNewsExample;

  FavCategoryListing({super.key});

  @override
  State<FavCategoryListing> createState() => _FavCategoryListingState();
}

class _FavCategoryListingState extends State<FavCategoryListing> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(12),
              itemCount: 5,
              itemBuilder: (context, index) {
                if (index < widget.categoryListing.length) {
                  return FavSingleCategory(
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
