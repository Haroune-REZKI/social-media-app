import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';
import 'package:mobile_dev_project/features/categories/business/entities/category_news.dart';
import 'package:mobile_dev_project/features/categories/components/categories_page_listing.dart';
import 'package:mobile_dev_project/features/categories/components/custom_silver_app_bar.dart';

class CategoriesFeed extends StatefulWidget {
  final CategoryNews pageCategory;

  const CategoriesFeed({super.key, required this.pageCategory});

  @override
  State<CategoriesFeed> createState() => _CategoriesFeedState();
}

class _CategoriesFeedState extends State<CategoriesFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CustomSilverAppBar(pageCategory: widget.pageCategory),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Latest Posts",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          CategoriesPageListing(),
        ],
      ),
    );
  }
}
