class Itinerary {
	int? id;
	int? packageId;
	String? title;
	String? time;
	String? description;
	bool? isActive;

	Itinerary({
		this.id, 
		this.packageId, 
		this.title, 
		this.time, 
		this.description, 
		this.isActive, 
	});

	factory Itinerary.fromJson(Map<String, dynamic> json) => Itinerary(
				id: json['id'] as int?,
				packageId: json['packageId'] as int?,
				title: json['title'] as String?,
				time: json['time'] as String?,
				description: json['description'] as String?,
				isActive: json['isActive'] as bool?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'packageId': packageId,
				'title': title,
				'time': time,
				'description': description,
				'isActive': isActive,
			};
}
