import 'cruise_type.dart';
import 'image.dart';
import 'rating.dart';

class Cruise {
  int? id;
  String? name;
  int? rooms;
  int? maxCapacity;
  String? description;
  bool? isActive;
  CruiseType? cruiseType;
  List<CruiseImage>? images;
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
            ?.map((e) => CruiseImage.fromJson(e as Map<String, dynamic>))
            .toList(),
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
        'ratings': ratings?.map((e) => e.toJson()).toList(),
      };
}

class CruiseImage {
  final int? id;
  final int? cruiseId;
  final String? cruiseImg;
  final String? alt;

  CruiseImage({
    this.id,
    this.cruiseId,
    this.cruiseImg,
    this.alt,
  });

  factory CruiseImage.fromJson(Map<String, dynamic> json) {
    return CruiseImage(
      id: json['id'] as int?,
      cruiseId: json['cruiseId'] as int?,
      cruiseImg: json['cruiseImg'] as String?,
      alt: json['alt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cruiseId': cruiseId,
      'cruiseImg': cruiseImg,
      'alt': alt,
    };
  }
}
