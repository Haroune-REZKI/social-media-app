import 'package:flutter/material.dart';
import 'package:mobile_dev_project/features/posts/components/feed_post.dart';
import 'package:mobile_dev_project/features/posts/handlers/classes/post.dart';
import 'package:mobile_dev_project/features/posts/handlers/constants/main.dart';

class FeedPostsListing extends StatefulWidget {
  FeedPostsListing({super.key});

  final List<Post> postsSample = postsExample;

  @override
  State<FeedPostsListing> createState() => _FeedPostsListingState();
}

class _FeedPostsListingState extends State<FeedPostsListing> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
        
        if (index < widget.postsSample.length) {
          return FeedPost(
            postContent: widget.postsSample[index],
            isSinglePostView: false,
          );
        }

        return null;
      }),
    );
  }
}
