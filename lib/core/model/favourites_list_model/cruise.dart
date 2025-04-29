import 'cruise_type.dart';
import 'rating.dart';

class Cruise {
	int? id;
	int? rooms;
	int? maxCapacity;
	String? description;
	bool? isActive;
	CruiseType? cruiseType;
	List<Rating>? ratings;

	Cruise({
		this.id, 
		this.rooms, 
		this.maxCapacity, 
		this.description, 
		this.isActive, 
		this.cruiseType, 
		this.ratings, 
	});

	factory Cruise.fromJson(Map<String, dynamic> json) => Cruise(
				id: json['id'] as int?,
				rooms: json['rooms'] as int?,
				maxCapacity: json['maxCapacity'] as int?,
				description: json['description'] as String?,
				isActive: json['isActive'] as bool?,
				cruiseType: json['cruiseType'] == null
						? null
						: CruiseType.fromJson(json['cruiseType'] as Map<String, dynamic>),
				ratings: (json['ratings'] as List<dynamic>?)
						?.map((e) => Rating.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'rooms': rooms,
				'maxCapacity': maxCapacity,
				'description': description,
				'isActive': isActive,
				'cruiseType': cruiseType?.toJson(),
				'ratings': ratings?.map((e) => e.toJson()).toList(),
			};
}
