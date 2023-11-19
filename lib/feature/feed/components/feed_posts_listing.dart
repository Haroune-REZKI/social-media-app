import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile_dev_project/feature/posts/components/feed_post.dart';

class FeedPostsListing extends StatefulWidget {
  FeedPostsListing({super.key});

  final List<Map<String, dynamic>> postsSample = [
    {
      "fullname": "Haroune Rezki",
      "username": "harouuune",
      "avatar":
          "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg",
      "content": "Breaking news: el moudira has left the campus forever!",
      "likes": "573",
      "hasImage": Random().nextBool(),
      "isLiked": Random().nextBool(),
      "comments": "30",
      "hasBookmarked": Random().nextBool(),
      "timestamps": "35 min ago"
    },
    {
      "fullname": "Haroune Rezki",
      "username": "harouuune",
      "avatar":
          "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg",
      "content": "Breaking news: el moudira has left the campus forever!",
      "likes": "573",
      "hasImage": Random().nextBool(),
      "isLiked": Random().nextBool(),
      "comments": "30",
      "hasBookmarked": Random().nextBool(),
      "timestamps": "35 min ago"
    },
    {
      "fullname": "Haroune Rezki",
      "username": "harouuune",
      "avatar":
          "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg",
      "content": "Breaking news: el moudira has left the campus forever!",
      "likes": "573",
      "hasImage": Random().nextBool(),
      "isLiked": Random().nextBool(),
      "comments": "30",
      "hasBookmarked": Random().nextBool(),
      "timestamps": "35 min ago"
    },
    {
      "fullname": "Haroune Rezki",
      "username": "harouuune",
      "avatar":
          "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg",
      "content": "Breaking news: el moudira has left the campus forever!",
      "likes": "573",
      "hasImage": Random().nextBool(),
      "isLiked": Random().nextBool(),
      "comments": "30",
      "hasBookmarked": Random().nextBool(),
      "timestamps": "35 min ago"
    },
    {
      "fullname": "Haroune Rezki",
      "username": "harouuune",
      "avatar":
          "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg",
      "content": "Breaking news: el moudira has left the campus forever!",
      "likes": "573",
      "hasImage": Random().nextBool(),
      "isLiked": Random().nextBool(),
      "comments": "30",
      "hasBookmarked": Random().nextBool(),
      "timestamps": "35 min ago"
    },
    {
      "fullname": "Haroune Rezki",
      "username": "harouuune",
      "avatar":
          "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg",
      "content": "Breaking news: el moudira has left the campus forever!",
      "likes": "573",
      "hasImage": Random().nextBool(),
      "isLiked": Random().nextBool(),
      "comments": "30",
      "hasBookmarked": Random().nextBool(),
      "timestamps": "35 min ago"
    },
    {
      "fullname": "Haroune Rezki",
      "username": "harouuune",
      "avatar":
          "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg",
      "content": "Breaking news: el moudira has left the campus forever!",
      "likes": "573",
      "hasImage": Random().nextBool(),
      "isLiked": Random().nextBool(),
      "comments": "30",
      "hasBookmarked": Random().nextBool(),
      "timestamps": "35 min ago"
    },
  ];

  @override
  State<FeedPostsListing> createState() => _FeedPostsListingState();
}

class _FeedPostsListingState extends State<FeedPostsListing> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: ListView.builder(itemBuilder: (context, index) {
        if (index < widget.postsSample.length) {
          return FeedPost(
            postContent: widget.postsSample[index],
          );
        }

        return null;
      }),
    );
  }
}
