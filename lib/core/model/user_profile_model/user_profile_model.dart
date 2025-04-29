import 'data.dart';

class UserProfileModel {
	Data? data;

	UserProfileModel({this.data});

	factory UserProfileModel.fromJson(Map<String, dynamic> json) {
		return UserProfileModel(
			data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'data': data?.toJson(),
			};
}
