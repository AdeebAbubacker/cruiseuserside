import 'user.dart';

class LoginModel {
  User? user;
  String? token;

  LoginModel({this.user, this.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'token': token,
      };
}
