import 'image.dart';
import 'owner.dart';

class Cruise {
  int? id;
  String? name;
  int? rooms;
  int? maxCapacity;
  String? description;
  bool? isActive;
  List<Image>? images;
  Owner? owner;

  Cruise({
    this.id,
    this.name,
    this.rooms,
    this.maxCapacity,
    this.description,
    this.isActive,
    this.images,
    this.owner,
  });

  factory Cruise.fromJson(Map<String, dynamic> json) => Cruise(
        id: json['id'] as int?,
        name: json['name'] as String?,
        rooms: json['rooms'] as int?,
        maxCapacity: json['maxCapacity'] as int?,
        description: json['description'] as String?,
        isActive: json['isActive'] as bool?,
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
            .toList(),
        owner: json['owner'] == null
            ? null
            : Owner.fromJson(json['owner'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'rooms': rooms,
        'maxCapacity': maxCapacity,
        'description': description,
        'isActive': isActive,
        'images': images?.map((e) => e.toJson()).toList(),
        'owner': owner?.toJson(),
      };
}
