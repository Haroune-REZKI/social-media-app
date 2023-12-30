import 'package:flutter/material.dart';
import 'package:mobile_dev_project/features/feed/components/feed_categories_listing.dart';
import 'package:mobile_dev_project/features/feed/components/feed_posts_listing.dart';
import 'package:mobile_dev_project/features/profile/components/fav_category_listing.dart';

class Pages extends StatefulWidget {
  const Pages({super.key});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  bool isPosts = true;
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isPosts = true;
                });
              },
              child: Text("Posts", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    (isPosts) ? Color(0xFF006175) : Color(0xFF706C6C),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isPosts = false;
                });
              },
              child: Text("Channels", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    (!isPosts) ? Color(0xFF006175) : Color(0xFF706C6C),
              ),
            ),
          ],
        ),
        Visibility(
          child: FeedPostsListing(), //placeholder only
          visible: isPosts,
        ),
        Visibility(
          child: FavCategoryListing(), //handle overflow
          visible: !isPosts,
        )
      ],
    );
  }
}
