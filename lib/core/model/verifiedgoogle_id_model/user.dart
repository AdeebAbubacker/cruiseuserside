class User {
	int? id;
	String? name;
	String? email;
	dynamic phoneNumber;
	String? googleId;
	dynamic countryCode;

	User({
		this.id, 
		this.name, 
		this.email, 
		this.phoneNumber, 
		this.googleId, 
		this.countryCode, 
	});

	factory User.fromJson(Map<String, dynamic> json) => User(
				id: json['id'] as int?,
				name: json['name'] as String?,
				email: json['email'] as String?,
				phoneNumber: json['phoneNumber'] as dynamic,
				googleId: json['google_id'] as String?,
				countryCode: json['countryCode'] as dynamic,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'email': email,
				'phoneNumber': phoneNumber,
				'google_id': googleId,
				'countryCode': countryCode,
			};
}
