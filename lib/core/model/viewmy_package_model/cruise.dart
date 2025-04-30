import 'cruise_type.dart';
import 'image.dart';
import 'location.dart';

class Cruise {
  int? id;
  String? name;
  int? rooms;
  int? maxCapacity;
  String? description;
  bool? isActive;
  CruiseType? cruiseType;
  List<CruiseImage>? images;
  Location? location;
  List<dynamic>? ratings;

  Cruise({
    this.id,
    this.name,
    this.rooms,
    this.maxCapacity,
    this.description,
    this.isActive,
    this.cruiseType,
    this.images,
    this.location,
    this.ratings,
  });

  factory Cruise.fromJson(Map<String, dynamic> json) => Cruise(
        id: json['id'] as int?,
        name: json['name'] as String?,
        rooms: json['rooms'] as int?,
        maxCapacity: json['maxCapacity'] as int?,
        description: json['description'] as String?,
        isActive: json['isActive'] as bool?,
        cruiseType: json['cruiseType'] == null
            ? null
            : CruiseType.fromJson(json['cruiseType'] as Map<String, dynamic>),
        images: json["images"] == null
            ? []
            : List<CruiseImage>.from(
                json["images"]!.map((x) => CruiseImage.fromJson(x))),
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, dynamic>),
        ratings: json['ratings'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'rooms': rooms,
        'maxCapacity': maxCapacity,
        'description': description,
        'isActive': isActive,
        'cruiseType': cruiseType?.toJson(),
        'images': images?.map((e) => e.toJson()).toList(),
        'location': location?.toJson(),
        'ratings': ratings,
      };
}

class CruiseImage {
  int? id;
  int? cruiseId;
  String? cruiseImg;
  dynamic alt;

  CruiseImage({
    this.id,
    this.cruiseId,
    this.cruiseImg,
    this.alt,
  });

  factory CruiseImage.fromJson(Map<String, dynamic> json) => CruiseImage(
        id: json["id"],
        cruiseId: json["cruiseId"],
        cruiseImg: json["cruiseImg"],
        alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cruiseId": cruiseId,
        "cruiseImg": cruiseImg,
        "alt": alt,
      };
}
