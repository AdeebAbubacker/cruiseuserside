class User {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? countryCode;

  User({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.countryCode,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
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
