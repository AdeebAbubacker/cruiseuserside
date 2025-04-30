class Owner {
  int? id;
  int? userId;
  String? proofType;
  String? proofId;
  String? proofImage;
  String? countryCode;
  String? additionalPhone;

  Owner({
    this.id,
    this.userId,
    this.proofType,
    this.proofId,
    this.proofImage,
    this.countryCode,
    this.additionalPhone,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json['id'] as int?,
        userId: json['userId'] as int?,
        proofType: json['proofType'] as String?,
        proofId: json['proofId'] as String?,
        proofImage: json['proofImage'] as String?,
        countryCode: json['countryCode'] as String?,
        additionalPhone: json['additionalPhone'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'proofType': proofType,
        'proofId': proofId,
        'proofImage': proofImage,
        'countryCode': countryCode,
        'additionalPhone': additionalPhone,
      };
}
