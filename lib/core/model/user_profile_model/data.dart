class Data {
	int? id;
	String? name;
	String? email;
	String? phoneNumber;
	String? countryCode;

	Data({
		this.id, 
		this.name, 
		this.email, 
		this.phoneNumber, 
		this.countryCode, 
	});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
				id: json['id'] as int?,
				name: json['name'] as String?,
				email: json['email'] as String?,
				phoneNumber: json['phoneNumber'] as String?,
				countryCode: json['countryCode'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'email': email,
				'phoneNumber': phoneNumber,
				'countryCode': countryCode,
			};
}
