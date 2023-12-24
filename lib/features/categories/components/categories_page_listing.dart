import 'package:flutter/material.dart';
import 'package:mobile_dev_project/features/posts/business/entities/post.dart';
import 'package:mobile_dev_project/features/posts/components/feed_post.dart';

class CategoriesPageListing extends StatelessWidget {
  final List<Post> postsSample = [];

  CategoriesPageListing({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (index < postsSample.length) {
            return Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
              child: FeedPost(
                postContent: postsSample[index],
                isSinglePostView: false,
              ),
            );
          }
          return null;
        },
      ),
    );
  }
}
