import 'cruise.dart';

class Owner {
  int? id;
  int? userId;
  String? proofType;
  String? proofId;
  String? proofImage;
  String? countryCode;
  String? additionalPhone;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Cruise>? cruises;

  Owner({
    this.id,
    this.userId,
    this.proofType,
    this.proofId,
    this.proofImage,
    this.countryCode,
    this.additionalPhone,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.cruises,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        proofType: json['proof_type'] as String?,
        proofId: json['proof_id'] as String?,
        proofImage: json['proof_image'] as String?,
        countryCode: json['country_code'] as String?,
        additionalPhone: json['additional_phone'] as String?,
        deletedAt: json['deleted_at'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        cruises: (json['cruises'] as List<dynamic>?)
            ?.map((e) => Cruise.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'proof_type': proofType,
        'proof_id': proofId,
        'proof_image': proofImage,
        'country_code': countryCode,
        'additional_phone': additionalPhone,
        'deleted_at': deletedAt,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'cruises': cruises?.map((e) => e.toJson()).toList(),
      };
}
