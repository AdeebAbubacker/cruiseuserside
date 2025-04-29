import 'datum.dart';

class CruiseTypeModel {
	List<Datum>? data;

	CruiseTypeModel({this.data});

	factory CruiseTypeModel.fromJson(Map<String, dynamic> json) {
		return CruiseTypeModel(
			data: (json['data'] as List<dynamic>?)
						?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'data': data?.map((e) => e.toJson()).toList(),
			};
}
