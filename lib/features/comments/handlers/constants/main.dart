import 'dart:math';

import 'package:mobile_dev_project/features/comments/handlers/classes/comment.dart';

// NOTE: This is purely for testing
final List<Comment> commentsExample = [
  Comment(
    id: 0,
    fullname: "Haroune Rezki",
    username: "harouuune",
    avatar:
        "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg",
    content: "Breaking news: el moudira has left the campus forever!",
    likes: Random().nextInt(1000).toString(),
    isLiked: Random().nextBool(),
    hasBookmarked: Random().nextBool(),
    timestamps: "${Random().nextInt(59)} min ago",
  ),
  Comment(
    id: 1,
    fullname: "Haroune Rezki",
    username: "harouuune",
    avatar:
        "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg",
    content: "Breaking news: el moudira has left the campus forever!",
    likes: Random().nextInt(1000).toString(),
    isLiked: Random().nextBool(),
    hasBookmarked: Random().nextBool(),
    timestamps: "${Random().nextInt(59)} min ago",
  ),
  Comment(
    id: 2,
    fullname: "Haroune Rezki",
    username: "harouuune",
    avatar:
        "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg",
    content: "Breaking news: el moudira has left the campus forever!",
    likes: Random().nextInt(1000).toString(),
    isLiked: Random().nextBool(),
    hasBookmarked: Random().nextBool(),
    timestamps: "${Random().nextInt(59)} min ago",
  ),
  Comment(
    id: 3,
    fullname: "Haroune Rezki",
    username: "harouuune",
    avatar:
        "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg",
    content: "Breaking news: el moudira has left the campus forever!",
    likes: Random().nextInt(1000).toString(),
    isLiked: Random().nextBool(),
    hasBookmarked: Random().nextBool(),
    timestamps: "${Random().nextInt(59)} min ago",
  ),
  Comment(
    id: 4,
    fullname: "Haroune Rezki",
    username: "harouuune",
    avatar:
        "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg",
    content: "Breaking news: el moudira has left the campus forever!",
    likes: Random().nextInt(1000).toString(),
    isLiked: Random().nextBool(),
    hasBookmarked: Random().nextBool(),
    timestamps: "${Random().nextInt(59)} min ago",
  ),
  Comment(
    id: 5,
    fullname: "Haroune Rezki",
    username: "harouuune",
    avatar:
        "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg",
    content: "Breaking news: el moudira has left the campus forever!",
    likes: Random().nextInt(1000).toString(),
    isLiked: Random().nextBool(),
    hasBookmarked: Random().nextBool(),
    timestamps: "${Random().nextInt(59)} min ago",
  ),
  Comment(
    id: 6,
    fullname: "Haroune Rezki",
    username: "harouuune",
    avatar:
        "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg",
    content: "Breaking news: el moudira has left the campus forever!",
    likes: Random().nextInt(1000).toString(),
    isLiked: Random().nextBool(),
    hasBookmarked: Random().nextBool(),
    timestamps: "${Random().nextInt(59)} min ago",
  ),
];
