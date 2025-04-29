import 'booking_type.dart';
import 'cruise.dart';

class Datum {
	int? id;
	String? name;
	String? description;
	bool? isActive;
	int? cruiseId;
	String? avgRating;
	Cruise? cruise;
	List<BookingType>? bookingTypes;

	Datum({
		this.id, 
		this.name, 
		this.description, 
		this.isActive, 
		this.cruiseId, 
		this.avgRating, 
		this.cruise, 
		this.bookingTypes, 
	});

	factory Datum.fromJson(Map<String, dynamic> json) => Datum(
				id: json['id'] as int?,
				name: json['name'] as String?,
				description: json['description'] as String?,
				isActive: json['isActive'] as bool?,
				cruiseId: json['cruiseId'] as int?,
				avgRating: json['avgRating'] as String?,
				cruise: json['cruise'] == null
						? null
						: Cruise.fromJson(json['cruise'] as Map<String, dynamic>),
				bookingTypes: (json['bookingTypes'] as List<dynamic>?)
						?.map((e) => BookingType.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'description': description,
				'isActive': isActive,
				'cruiseId': cruiseId,
				'avgRating': avgRating,
				'cruise': cruise?.toJson(),
				'bookingTypes': bookingTypes?.map((e) => e.toJson()).toList(),
			};
}
