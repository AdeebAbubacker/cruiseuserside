import 'cruise_type.dart';
import 'image.dart';
import 'location.dart';
import 'rating.dart';

class Cruise {
  int? id;
  String? name;
  int? rooms;
  int? maxCapacity;
  String? description;
  bool? isActive;
  CruiseType? cruiseType;
  List<Image>? images;
  Location? location;
  List<Rating>? ratings;

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
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
            .toList(),
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, dynamic>),
        ratings: (json['ratings'] as List<dynamic>?)
            ?.map((e) => Rating.fromJson(e as Map<String, dynamic>))
            .toList(),
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
        'ratings': ratings?.map((e) => e.toJson()).toList(),
      };
}
