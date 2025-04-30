import 'owner.dart';

class Mypackages {
  int? id;
  String? name;
  String? email;
  String? googleId;
  DateTime? emailVerifiedAt;
  String? countryCode;
  String? phone;
  String? imagePath;
  int? isActive;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  Owner? owner;

  Mypackages({
    this.id,
    this.name,
    this.email,
    this.googleId,
    this.emailVerifiedAt,
    this.countryCode,
    this.phone,
    this.imagePath,
    this.isActive,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.owner,
  });

  factory Mypackages.fromJson(Map<String, dynamic> json) => Mypackages(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        googleId: json['google_id'] as String?,
        emailVerifiedAt: json['email_verified_at'] == null
            ? null
            : DateTime.parse(json['email_verified_at'] as String),
        countryCode: json['country_code'] as String?,
        phone: json['phone'] as String?,
        imagePath: json['image_path'] as String?,
        isActive: json['is_active'] as int?,
        deletedAt: json['deleted_at'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        owner: json['owner'] == null
            ? null
            : Owner.fromJson(json['owner'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'google_id': googleId,
        'email_verified_at': emailVerifiedAt?.toIso8601String(),
        'country_code': countryCode,
        'phone': phone,
        'image_path': imagePath,
        'is_active': isActive,
        'deleted_at': deletedAt,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'owner': owner?.toJson(),
      };
}
