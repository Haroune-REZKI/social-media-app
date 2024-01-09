import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobile_dev_project/core/connection/network_info.dart';
import 'package:mobile_dev_project/features/authentication/business/repositories/sign_in.dart';
import 'package:mobile_dev_project/features/authentication/business/usecases/sign_up.dart';
import 'package:mobile_dev_project/features/authentication/controllers/handlers.dart';
import 'package:mobile_dev_project/features/authentication/data/datasource/local_data_source.dart';
import 'package:mobile_dev_project/features/authentication/data/datasource/remote_data_source.dart';
import 'package:mobile_dev_project/features/authentication/data/repositories/sign_up_repository.dart';
import 'package:mobile_dev_project/utils/components/custom_circular_progress_indicator.dart';

class SignUpController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  void doSignUp(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CustomCircularProgressIndicator(),
      ),
    );

    SignUpRepositoryImpl repository = SignUpRepositoryImpl(
      remoteDataSource: AuthRemoteDataSourceImpl(dio: Dio()),
      networkInfo: NetworkInfoImpl(
        InternetConnectionChecker(),
      ),
    );

    final failureOrResult = await SignUp(repository).call(
      SignInOptions(
        username: username.value.text,
        password: password.value.text,
      ),
    );

    failureOrResult.fold(
      (failure) => {
        Navigator.pop(context),
        print("FAILURE $failure"),
        displayMessageToUser(
          "Please Verify your Credentials then Retry !",
          context,
        )
      },
      (result) => {
        UserLocalDataSource()
            .saveUsernameAndTokenToLocalCache(result.username, result.token),
        Get.toNamed("/personal_info_page")
      },
    );
  }
}
