import 'user.dart';

class UserUpdateSuccesModel {
	String? message;
	User? user;

	UserUpdateSuccesModel({this.message, this.user});

	factory UserUpdateSuccesModel.fromJson(Map<String, dynamic> json) {
		return UserUpdateSuccesModel(
			message: json['message'] as String?,
			user: json['user'] == null
						? null
						: User.fromJson(json['user'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'message': message,
				'user': user?.toJson(),
			};
}
