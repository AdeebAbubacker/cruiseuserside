import 'image.dart';
import 'location.dart';

class Cruise {
	int? id;
	String? name;
	int? rooms;
	int? maxCapacity;
	String? description;
	bool? isActive;
	List<Image>? images;
	Location? location;

	Cruise({
		this.id, 
		this.name, 
		this.rooms, 
		this.maxCapacity, 
		this.description, 
		this.isActive, 
		this.images, 
		this.location, 
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
				location: json['location'] == null
						? null
						: Location.fromJson(json['location'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'rooms': rooms,
				'maxCapacity': maxCapacity,
				'description': description,
				'isActive': isActive,
				'images': images?.map((e) => e.toJson()).toList(),
				'location': location?.toJson(),
			};
}
