import 'data.dart';

class ViewmyPackageModel {
	Data? data;

	ViewmyPackageModel({this.data});

	factory ViewmyPackageModel.fromJson(Map<String, dynamic> json) {
		return ViewmyPackageModel(
			data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'data': data?.toJson(),
			};
}
