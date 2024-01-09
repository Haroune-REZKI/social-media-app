import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobile_dev_project/core/connection/network_info.dart';
import 'package:mobile_dev_project/features/authentication/business/repositories/sign_up_fullinfo_repository.dart';
import 'package:mobile_dev_project/features/authentication/business/usecases/sign_up_fullinfo.dart';
import 'package:mobile_dev_project/features/authentication/controllers/handlers.dart';
import 'package:mobile_dev_project/features/authentication/data/datasource/local_data_source.dart';
import 'package:mobile_dev_project/features/authentication/data/datasource/remote_data_source.dart';
import 'package:mobile_dev_project/features/authentication/data/models/user.dart';
import 'package:mobile_dev_project/features/authentication/data/repositories/sign_up_fullinfo_impl.dart';
import 'package:mobile_dev_project/utils/components/custom_circular_progress_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalInfoController extends GetxController {
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  Rx<Gender> selectedGender = Gender.Male.obs;

  void selectGender(Gender gender) {
    selectedGender.value = gender;
  }

  void doSignUpPersonalInfo(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CustomCircularProgressIndicator(),
      ),
    );

    SignUpFullInfoRepositoryImpl repository = SignUpFullInfoRepositoryImpl(
      remoteDataSource: AuthRemoteDataSourceImpl(dio: Dio()),
      networkInfo: NetworkInfoImpl(
        InternetConnectionChecker(),
      ),
    );

    SharedPreferences userPrefs = await SharedPreferences.getInstance();
    
    final String? username = userPrefs.getString("username");
    final String? token = userPrefs.getString("token");

    if (username == null || token == null) {
      // ignore: use_build_context_synchronously
      displayMessageToUser(
        "Please Verify your Username then Retry !",
        context,
      );
      return;
    }

    print("USERNAME: $username");
    print("fullname: ${fullName.value.text}");
    print("email: ${email.value.text}");
    print("phoneNumber: ${phoneNumber.value.text}");
    print("selectedGender: ${selectedGender.value}");

    final failureOrUser = await SignUpFullInfo(repository).call(
      SignUpFullInfoOptions(
        token: token,
        username: username,
        fullname: fullName.value.text,
        email: email.value.text,
        phoneNumber: phoneNumber.value.text,
        gender: selectedGender.value == Gender.Male ? "M" : "F",
      ),
    );

    failureOrUser.fold(
      (failure) => {
        Navigator.pop(context),
        displayMessageToUser(
          "Please Verify your Credentials then Retry !",
          context,
        )
      },
      (user) => {
        UserLocalDataSource().saveUserToLocalCache(
          UserModel(
            id: user.id,
            fullname: user.fullname,
            username: user.username,
            email: user.email,
            bio: user.bio,
            createdAt: user.createdAt,
            password: user.password,
            phoneNumber: user.phoneNumber,
            gender: user.gender,
            token: user.token,
          ),
        ),
        Get.toNamed("/feed")
      },
    );
  }
}
