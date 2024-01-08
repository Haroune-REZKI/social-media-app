import 'package:mobile_dev_project/features/categories/business/entities/category_news.dart';
import 'package:mobile_dev_project/features/feed/business/entities/list_of_categories.dart';

class ListOfCategoriesModel extends ListOfCategoriesNews {
  ListOfCategoriesModel({required List<CategoryNews> categories})
      : super(categories: categories);

  factory ListOfCategoriesModel.fromJson(Map<String, dynamic> json) {
    List<CategoryNews> convertedListOfCategories = [];

    if (json.containsKey("data")) {
      // Ensure that the key "data" exists in the JSON before accessing it
      for (var element in json["data"]) {
        CategoryNews currentCategory = CategoryNews(
          title: element["title"],
          categoryColor: element["categoryColor"],
          categoryName: element["categoryName"],
          categoryPicture: element["categoryPicture"],
        );

        convertedListOfCategories.add(currentCategory);
      }
    } else {
      // Handle the case where "data" key is missing in the JSON
      throw FormatException('Invalid JSON format: Missing "data" key');
    }

    return ListOfCategoriesModel(categories: convertedListOfCategories);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "categories": categories,
    };
  }
}
