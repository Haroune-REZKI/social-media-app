import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobile_dev_project/core/connection/network_info.dart';
import 'package:mobile_dev_project/features/feed/business/entities/list_of_categories.dart';
import 'package:mobile_dev_project/features/feed/business/usecase/get_list_of_categories.dart';
import 'package:mobile_dev_project/features/feed/data/datasource/remote_data_source_categories.dart';
import 'package:mobile_dev_project/features/feed/data/repositories/list_of_categories_repository.dart';

class ListOfCategoriesController extends GetxController
    with StateMixin<ListOfCategoriesNews> {
  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  fetchCategories() async {
    change(ListOfCategoriesNews(categories: []), status: RxStatus.loading());
    ListOfCategoriesRepositoryImpl repository = ListOfCategoriesRepositoryImpl(
      remoteDataSource: ListOfCategoriesRemoteDataSourceImpl(
        dio: Dio(),
      ),
      networkInfo: NetworkInfoImpl(
        InternetConnectionChecker(),
      ),
    );

    final failureOrListOfCategories =
        await GetListOfCategories(repository).call();

    failureOrListOfCategories.fold(
      (failure) => {
        // hasFailed.value = true;
        change(ListOfCategoriesNews(categories: []),
            status: RxStatus.error(failure.toString()))
      },
      (listOfCategories) => {
        // categories.value = ListOfCategories
        change(listOfCategories, status: RxStatus.success())
      },
    );
  }
}
