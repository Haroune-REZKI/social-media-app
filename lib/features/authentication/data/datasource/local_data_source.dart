import 'package:mobile_dev_project/features/authentication/data/models/user.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserLocalDataSource {
  void saveUserToLocalCache(UserModel user) async {
    SharedPreferences userPrefs = await SharedPreferences.getInstance();

    String userJsonInString = jsonEncode(user.toJson());
    userPrefs.setString("user_data", userJsonInString);
    userPrefs.setString("token", user.token ?? "");
  }

  void saveUsernameAndTokenToLocalCache(String username, String token) async {
    SharedPreferences userPrefs = await SharedPreferences.getInstance();

    userPrefs.setString("username", username);
    userPrefs.setString("token", token);
  }

  static Future<UserModel?> retrieveUserFromLocalCache() async {
    SharedPreferences userPrefs = await SharedPreferences.getInstance();
    String? userJson = userPrefs.getString('user_data');
    if (userJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userJson);
      return UserModel.fromJson(userMap);
    }

    return null;
  }

  static Future<String?> retrieveTokenFromLocalCache() async {
    SharedPreferences userPrefs = await SharedPreferences.getInstance();
    String? token = userPrefs.getString('token');
    if (token != null) {
      return token;
    }

    return null;
  }
}
