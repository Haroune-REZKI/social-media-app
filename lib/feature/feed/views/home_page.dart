import 'package:flutter/material.dart';
import 'package:mobile_dev_project/feature/feed/components/feed_posts_listing.dart';

import 'package:mobile_dev_project/utils/components/app_bar.dart';
import 'package:mobile_dev_project/feature/feed/components/feed_categories_listing.dart';

class HomeFeed extends StatelessWidget {
  const HomeFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          children: [
            FeedCategoriesListing(),
            Expanded(child: FeedPostsListing())
          ],
        ),
      ),
    );
  }
}
