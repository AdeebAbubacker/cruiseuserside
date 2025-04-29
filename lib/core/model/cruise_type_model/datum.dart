class Datum {
	int? id;
	String? modelName;
	String? type;
	String? image;

	Datum({this.id, this.modelName, this.type, this.image});

	factory Datum.fromJson(Map<String, dynamic> json) => Datum(
				id: json['id'] as int?,
				modelName: json['modelName'] as String?,
				type: json['type'] as String?,
				image: json['image'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'modelName': modelName,
				'type': type,
				'image': image,
			};
}
