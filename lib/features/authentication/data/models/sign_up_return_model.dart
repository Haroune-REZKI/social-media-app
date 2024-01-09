import 'package:mobile_dev_project/features/authentication/business/entities/sign_up_return.dart';

class SignUpReturnModel extends SignUpReturn {
  SignUpReturnModel({
    required super.username,
    required super.token,
  });

  factory SignUpReturnModel.fromJson(Map<String, dynamic> json) {
    return SignUpReturnModel(
      username: json["data"]["username"],
      token: json["data"]["token"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "data": {
        "token": token,
        "username": username,
      }
    };
  }
}
