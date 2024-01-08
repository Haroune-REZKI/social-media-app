import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_dev_project/config/font.config.dart';
import 'package:mobile_dev_project/features/feed/components/feed_single_category.dart';
import 'package:mobile_dev_project/features/feed/controllers/list_of_categories.dart';

class FeedCategoriesListing extends StatelessWidget {
  FeedCategoriesListing({super.key});
  final ListOfCategoriesController categoriesController =
      Get.put(ListOfCategoriesController());

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
            child: categoriesController.obx(
              (state) => ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(12),
                itemCount: state?.categories.length ?? 0,
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 20);
                },
                itemBuilder: (context, index) {
                  if (index < (state?.categories.length ?? 0)) {
                    return FeedSingleCategory(
                      categoryData: state!.categories[index],
                    );
                  }
                  return null;
                },
              ),
              onEmpty: const Center(child: Text("No categories available")),
              onError: (e) => Center(child: Text("$e")),
            ),
          ),
        ],
      ),
    );
  }
}
