import 'user.dart';

class VerifiedgoogleIdModel {
  User? user;
  String? token;

  VerifiedgoogleIdModel({this.user, this.token});

  factory VerifiedgoogleIdModel.fromJson(Map<String, dynamic> json) {
    return VerifiedgoogleIdModel(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'token': token,
      };
}
