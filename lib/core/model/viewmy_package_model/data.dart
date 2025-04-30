import 'amenity.dart';
import 'booking_type.dart';
import 'cruise.dart';
import 'image.dart';
import 'unavailable_date.dart';

class Data {
	int? id;
	String? name;
	String? description;
	bool? isActive;
	int? cruiseId;
	List<Image>? images;
	Cruise? cruise;
	List<Amenity>? amenities;
	List<dynamic>? food;
	List<dynamic>? itineraries;
	List<BookingType>? bookingTypes;
	List<UnavailableDate>? unavailableDate;

	Data({
		this.id, 
		this.name, 
		this.description, 
		this.isActive, 
		this.cruiseId, 
		this.images, 
		this.cruise, 
		this.amenities, 
		this.food, 
		this.itineraries, 
		this.bookingTypes, 
		this.unavailableDate, 
	});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
				id: json['id'] as int?,
				name: json['name'] as String?,
				description: json['description'] as String?,
				isActive: json['isActive'] as bool?,
				cruiseId: json['cruiseId'] as int?,
				images: (json['images'] as List<dynamic>?)
						?.map((e) => Image.fromJson(e as Map<String, dynamic>))
						.toList(),
				cruise: json['cruise'] == null
						? null
						: Cruise.fromJson(json['cruise'] as Map<String, dynamic>),
				amenities: (json['amenities'] as List<dynamic>?)
						?.map((e) => Amenity.fromJson(e as Map<String, dynamic>))
						.toList(),
				food: json['food'] as List<dynamic>?,
				itineraries: json['itineraries'] as List<dynamic>?,
				bookingTypes: (json['bookingTypes'] as List<dynamic>?)
						?.map((e) => BookingType.fromJson(e as Map<String, dynamic>))
						.toList(),
				unavailableDate: (json['unavailableDate'] as List<dynamic>?)
						?.map((e) => UnavailableDate.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'description': description,
				'isActive': isActive,
				'cruiseId': cruiseId,
				'images': images?.map((e) => e.toJson()).toList(),
				'cruise': cruise?.toJson(),
				'amenities': amenities?.map((e) => e.toJson()).toList(),
				'food': food,
				'itineraries': itineraries,
				'bookingTypes': bookingTypes?.map((e) => e.toJson()).toList(),
				'unavailableDate': unavailableDate?.map((e) => e.toJson()).toList(),
			};
}
