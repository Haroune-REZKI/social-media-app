import 'package:flutter/material.dart';

class Category {
  int id;
  String description;
  String category;
  String title;
  String bgImage;
  Color mainColor;
  Color bgColor;
  bool isSubscribed;

  Category({
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.bgImage,
    required this.mainColor,
    required this.bgColor,
    required this.isSubscribed,
  });
}
