import 'dart:math';

import 'package:mobile_dev_project/features/posts/handlers/classes/post.dart';

// NOTE: This is purely for testing
final List<Post> postsExample = [
  Post(
    id: 0,
    fullname: "Haroune Rezki",
    username: "harouuune",
    avatar:
        "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg",
    content: "Breaking news: el moudira has left the campus forever!",
    likes: "573",
    hasImage: Random().nextBool(),
    isLiked: Random().nextBool(),
    comments: "30",
    hasBookmarked: Random().nextBool(),
    timestamps: "35 min ago",
  ),
  Post(
    id: 1,
    fullname: "Haroune Rezki",
    username: "harouuune",
    avatar:
        "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg",
    content: "Breaking news: el moudira has left the campus forever!",
    likes: "573",
    hasImage: Random().nextBool(),
    isLiked: Random().nextBool(),
    comments: "30",
    hasBookmarked: Random().nextBool(),
    timestamps: "35 min ago",
  ),
  Post(
    id: 2,
    fullname: "Haroune Rezki",
    username: "harouuune",
    avatar:
        "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg",
    content: "Breaking news: el moudira has left the campus forever!",
    likes: "573",
    hasImage: Random().nextBool(),
    isLiked: Random().nextBool(),
    comments: "30",
    hasBookmarked: Random().nextBool(),
    timestamps: "35 min ago",
  ),
  Post(
    id: 3,
    fullname: "Haroune Rezki",
    username: "harouuune",
    avatar:
        "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg",
    content: "Breaking news: el moudira has left the campus forever!",
    likes: "573",
    hasImage: Random().nextBool(),
    isLiked: Random().nextBool(),
    comments: "30",
    hasBookmarked: Random().nextBool(),
    timestamps: "35 min ago",
  ),
  Post(
    id: 4,
    fullname: "Haroune Rezki",
    username: "harouuune",
    avatar:
        "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg",
    content: "Breaking news: el moudira has left the campus forever!",
    likes: "573",
    hasImage: Random().nextBool(),
    isLiked: Random().nextBool(),
    comments: "30",
    hasBookmarked: Random().nextBool(),
    timestamps: "35 min ago",
  ),
  Post(
    id: 5,
    fullname: "Haroune Rezki",
    username: "harouuune",
    avatar:
        "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg",
    content: "Breaking news: el moudira has left the campus forever!",
    likes: "573",
    hasImage: Random().nextBool(),
    isLiked: Random().nextBool(),
    comments: "30",
    hasBookmarked: Random().nextBool(),
    timestamps: "35 min ago",
  ),
  Post(
    id: 6,
    fullname: "Haroune Rezki",
    username: "harouuune",
    avatar:
        "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg",
    content: "Breaking news: el moudira has left the campus forever!",
    likes: "573",
    hasImage: Random().nextBool(),
    isLiked: Random().nextBool(),
    comments: "30",
    hasBookmarked: Random().nextBool(),
    timestamps: "35 min ago",
  ),
];
