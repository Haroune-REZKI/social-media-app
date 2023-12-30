class User {
  int id;
  String fullname;
  String username;
  String email;
  String bio;
  String createdAt;
  String password;
  String? phoneNumber;
  String? gender;

  User({
    required this.id,
    required this.fullname,
    required this.username,
    required this.email,
    required this.bio,
    required this.createdAt,
    required this.password,
    required this.phoneNumber,
    required this.gender,
  });
}
