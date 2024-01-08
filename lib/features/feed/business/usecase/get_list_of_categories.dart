import 'package:dartz/dartz.dart';
import 'package:mobile_dev_project/core/error/failure.dart';
import 'package:mobile_dev_project/features/feed/business/entities/list_of_categories.dart';
import 'package:mobile_dev_project/features/feed/business/repositories/list_of_categories_repository.dart';

class GetListOfCategories {
  final ListOfCategoriesRepository repository;

  GetListOfCategories(this.repository);

  Future<Either<Failure, ListOfCategoriesNews>> call() async {
    return await repository.getListOfCategories();
  }
}
