import 'package:flutter/material.dart';
import 'package:mobile_dev_project/config/colors.config.dart';
import 'package:mobile_dev_project/features/feed/components/feed_posts_listing.dart';

import 'package:mobile_dev_project/utils/components/app_bar.dart';
import 'package:mobile_dev_project/features/feed/components/feed_categories_listing.dart';
import 'package:mobile_dev_project/utils/components/bottom_navigation_bar.dart';

class HomeFeed extends StatelessWidget {
  const HomeFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(parentContext: context, pageTitle: "Feed",),
      backgroundColor: AppColors.white,
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [FeedCategoriesListing(), FeedPostsListing()],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: 0,
      ),
    );
  }
}
