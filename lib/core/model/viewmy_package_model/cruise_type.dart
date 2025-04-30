class CruiseType {
  int? id;
  String? modelName;
  String? type;
  String? image;

  CruiseType({this.id, this.modelName, this.type, this.image});

  factory CruiseType.fromJson(Map<String, dynamic> json) => CruiseType(
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
