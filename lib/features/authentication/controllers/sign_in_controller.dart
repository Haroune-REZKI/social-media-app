import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobile_dev_project/core/connection/network_info.dart';
import 'package:mobile_dev_project/features/authentication/business/repositories/sign_in.dart';
import 'package:mobile_dev_project/features/authentication/data/datasource/remote_data_source.dart';
import 'package:mobile_dev_project/features/authentication/data/repositories/sign_in_impl.dart';
import 'package:mobile_dev_project/utils/components/custom_circular_progress_indicator.dart';
import 'package:mobile_dev_project/features/authentication/business/usecases/sign_in.dart';
import 'package:mobile_dev_project/features/authentication/controllers/handlers.dart';

class SignInController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  void doLogin(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CustomCircularProgressIndicator(),
      ),
    );

    SignInRepositoryImpl repository = SignInRepositoryImpl(
      remoteDataSource: SignInRemoteDataSourceImpl(dio: Dio()),
      networkInfo: NetworkInfoImpl(
        InternetConnectionChecker(),
      ),
    );

    final failureOrUser = await SignIn(repository).call(
      SignInOptions(
        username: username.value.text,
        password: password.value.text,
      ),
    );

    failureOrUser.fold(
      (failure) => {
        Navigator.pop(context),
        displayMessageToUser(
            "Please Verify your Credentials then Retry !", context)
      },
      (user) => {Get.toNamed("/feed")},
    );
  }
}
