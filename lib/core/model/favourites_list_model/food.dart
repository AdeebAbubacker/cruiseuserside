class Food {
	int? id;
	String? title;
	String? description;
	String? image;
	bool? isVeg;
	String? diningTime;

	Food({
		this.id, 
		this.title, 
		this.description, 
		this.image, 
		this.isVeg, 
		this.diningTime, 
	});

	factory Food.fromJson(Map<String, dynamic> json) => Food(
				id: json['id'] as int?,
				title: json['title'] as String?,
				description: json['description'] as String?,
				image: json['image'] as String?,
				isVeg: json['isVeg'] as bool?,
				diningTime: json['diningTime'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'title': title,
				'description': description,
				'image': image,
				'isVeg': isVeg,
				'diningTime': diningTime,
			};
}
