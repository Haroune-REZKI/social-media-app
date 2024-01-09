import "package:dartz/dartz.dart";
import "package:mobile_dev_project/core/error/failure.dart";
import "package:mobile_dev_project/features/feed/business/entities/list_of_categories.dart";

abstract class ListOfCategoriesRepository {
  Future<Either<Failure, ListOfCategoriesNews>> getListOfCategories();
}
