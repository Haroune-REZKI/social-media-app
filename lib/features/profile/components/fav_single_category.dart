// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';
import 'package:mobile_dev_project/features/categories/handlers/classes/category.dart';
import 'package:mobile_dev_project/features/categories/views/categories_feed.dart';

class FavSingleCategory extends StatefulWidget {
  Category categoryData;

  FavSingleCategory({super.key, required this.categoryData});

  void handleRedirection(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoriesFeed(pageCategory: categoryData),
      ),
    );
  }

  @override
  State<FavSingleCategory> createState() => _FavSingleCategoryState();
}

class _FavSingleCategoryState extends State<FavSingleCategory> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.handleRedirection(context);
      },
      child: Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        constraints: const BoxConstraints(maxWidth: 120),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.categoryData.bgImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.categoryData.bgColor,
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
                    widget.categoryData.category,
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
