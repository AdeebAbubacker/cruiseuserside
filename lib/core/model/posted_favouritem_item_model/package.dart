class Package {
	int? id;
	String? name;
	String? description;
	bool? isActive;
	int? cruiseId;

	Package({
		this.id, 
		this.name, 
		this.description, 
		this.isActive, 
		this.cruiseId, 
	});

	factory Package.fromJson(Map<String, dynamic> json) => Package(
				id: json['id'] as int?,
				name: json['name'] as String?,
				description: json['description'] as String?,
				isActive: json['isActive'] as bool?,
				cruiseId: json['cruiseId'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'description': description,
				'isActive': isActive,
				'cruiseId': cruiseId,
			};
}
