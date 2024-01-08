// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_dev_project/config/colors.config.dart';
import 'package:mobile_dev_project/features/categories/business/entities/category_news.dart';
import 'package:mobile_dev_project/features/categories/views/categories_feed.dart';

class FeedSingleCategory extends StatefulWidget {
  CategoryNews categoryData;

  FeedSingleCategory({super.key, required this.categoryData});

  void handleRedirection(BuildContext context) {
    Get.to(CategoriesFeed(pageCategory: categoryData));
  }

  @override
  State<FeedSingleCategory> createState() => _FeedSingleCategoryState();
}

class _FeedSingleCategoryState extends State<FeedSingleCategory> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.handleRedirection(context);
      },
      child: Container(
        constraints: const BoxConstraints(maxWidth: 120),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.categoryData.categoryPicture),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(int.parse(widget.categoryData.categoryColor)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.categoryData.categoryName,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.light,
                    ),
                  ),
                  Text(
                    widget.categoryData.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
