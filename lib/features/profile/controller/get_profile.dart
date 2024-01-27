import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobile_dev_project/core/connection/network_info.dart';
import 'package:mobile_dev_project/features/authentication/business/entities/user.dart';
import 'package:mobile_dev_project/features/authentication/data/repositories/get_user_by_token.dart';
import 'package:mobile_dev_project/features/profile/business/usecase/get_user_local.dart';
import 'package:mobile_dev_project/features/profile/data/repository/get_user_local.dart';

class UserProfileController extends GetxController
    with StateMixin<User> {

  @override
  void onInit() {
    super.onInit();
    getUserDetails();
  }

  getUserDetails() async {
    change(null, status: RxStatus.loading());
    GetUserLocalImpl repository = GetUserLocalImpl();
    
    final failureOrListOfPosts =
        await GetUserLocal(repository).call();

    failureOrListOfPosts.fold(
      (failure) => {
        // hasFailed.value = true;
        change(null,
            status: RxStatus.error(failure.toString()))
      },
      (profile) => {
        // posts.value = listOfPosts
        change(profile, status: RxStatus.success())
      },
    );
  }
}