import 'package:mobile_dev_project/features/authentication/business/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.fullname,
    required super.username,
    required super.email,
    required super.bio,
    required super.createdAt,
    required super.password,
    required super.phoneNumber,
    required super.gender,
    required super.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["data"]["user"]["id"],
      fullname: json["data"]["user"]["fullname"],
      username: json["data"]["user"]["username"],
      email: json["data"]["user"]["email"],
      bio: json["data"]["user"]["bio"],
      createdAt: json["data"]["user"]["createdAt"],
      password: json["data"]["user"]["password"],
      phoneNumber: json["data"]["user"]["phoneNumber"],
      gender: json["data"]["user"]["gender"],
      token: json["data"]["token"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "data": {
        "token": token,
        "user": {
          "id": id,
          "fullname": fullname,
          "username": username,
          "email": email,
          "bio": bio,
          "createdAt": createdAt,
          "password": password,
          "phoneNumber": phoneNumber,
          "gender": gender,
        }
      }
    };
  }
}
