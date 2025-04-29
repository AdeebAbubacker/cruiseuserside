class Location {
	int? id;
	String? name;
	String? district;
	String? state;
	String? country;
	String? thumbnail;
	String? mapUrl;

	Location({
		this.id, 
		this.name, 
		this.district, 
		this.state, 
		this.country, 
		this.thumbnail, 
		this.mapUrl, 
	});

	factory Location.fromJson(Map<String, dynamic> json) => Location(
				id: json['id'] as int?,
				name: json['name'] as String?,
				district: json['district'] as String?,
				state: json['state'] as String?,
				country: json['country'] as String?,
				thumbnail: json['thumbnail'] as String?,
				mapUrl: json['mapUrl'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'district': district,
				'state': state,
				'country': country,
				'thumbnail': thumbnail,
				'mapUrl': mapUrl,
			};
}
