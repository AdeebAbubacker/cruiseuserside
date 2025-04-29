import 'user.dart';

class RegistrationModel {
	User? user;
	String? token;

	RegistrationModel({this.user, this.token});

	factory RegistrationModel.fromJson(Map<String, dynamic> json) {
		return RegistrationModel(
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
