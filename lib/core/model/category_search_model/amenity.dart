class Amenity {
	int? id;
	String? name;
	String? icon;

	Amenity({this.id, this.name, this.icon});

	factory Amenity.fromJson(Map<String, dynamic> json) => Amenity(
				id: json['id'] as int?,
				name: json['name'] as String?,
				icon: json['icon'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'icon': icon,
			};
}
