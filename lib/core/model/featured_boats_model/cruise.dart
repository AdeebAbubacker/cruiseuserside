import 'location.dart';

class Cruise {
	int? id;
	String? name;
	int? rooms;
	int? maxCapacity;
	String? description;
	bool? isActive;
	Location? location;

	Cruise({
		this.id, 
		this.name, 
		this.rooms, 
		this.maxCapacity, 
		this.description, 
		this.isActive, 
		this.location, 
	});

	factory Cruise.fromJson(Map<String, dynamic> json) => Cruise(
				id: json['id'] as int?,
				name: json['name'] as String?,
				rooms: json['rooms'] as int?,
				maxCapacity: json['maxCapacity'] as int?,
				description: json['description'] as String?,
				isActive: json['isActive'] as bool?,
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
				'location': location?.toJson(),
			};
}
