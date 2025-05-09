class Data {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  dynamic googleId;
  String? countryCode;
  String? imagePath;

  Data({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.googleId,
    this.countryCode,
    this.imagePath,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        googleId: json['google_id'] as dynamic,
        countryCode: json['countryCode'] as String?,
        imagePath: json['image_path'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phoneNumber': phoneNumber,
        'google_id': googleId,
        'countryCode': countryCode,
        'image_path': imagePath,
      };
}
