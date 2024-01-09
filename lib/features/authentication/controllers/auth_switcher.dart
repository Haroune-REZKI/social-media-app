import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobile_dev_project/core/connection/network_info.dart';
import 'package:mobile_dev_project/features/authentication/business/usecases/get_user_by_token.dart';
import 'package:mobile_dev_project/features/authentication/data/datasource/remote_data_source.dart';
import 'package:mobile_dev_project/features/authentication/data/models/user.dart';
import 'package:mobile_dev_project/features/authentication/data/repositories/get_user_by_token.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthSwitcherController extends GetxController
    with StateMixin<UserModel?> {
  @override
  void onInit() {
    super.onInit();
    fetchUserByToken();
  }

  fetchUserByToken() async {
    change(null, status: RxStatus.loading());
    GetUserByTokenImpl repository = GetUserByTokenImpl(
      remoteDataSource: AuthRemoteDataSourceImpl(
        dio: Dio(),
      ),
      networkInfo: NetworkInfoImpl(
        InternetConnectionChecker(),
      ),
    );

    SharedPreferences userPrefs = await SharedPreferences.getInstance();
    final String? token = userPrefs.getString("token");

    if (token == null) {
      change(null, status: RxStatus.error("No Token Provided"));
      return;
    }

    final failureOrUser = await GetUserByToken(repository).call(token);

    failureOrUser.fold(
      (failure) => {
        // hasFailed.value = true;
        print("FAILURE: $failure"),
        change(null, status: RxStatus.error(failure.toString()))
      },
      (user) => {
        // posts.value = listOfPosts
        print("FAILURE: $user"),
        change(user as UserModel?, status: RxStatus.success())
      },
    );
  }
}
