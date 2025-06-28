class ProfileUpdateValidation {
  String? message;
  Errors? errors;

  ProfileUpdateValidation({this.message, this.errors});

  factory ProfileUpdateValidation.fromJson(Map<String, dynamic> json) {
    return ProfileUpdateValidation(
      message: json['message'] as String?,
      errors: json['errors'] != null
          ? Errors.fromJson(json['errors'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'errors': errors?.toJson(),
      };
}

class Errors {
  List<String>? phone;

  Errors({this.phone});

  factory Errors.fromJson(Map<String, dynamic> json) {
    return Errors(
      phone: json['phone'] != null
          ? List<String>.from(json['phone'] as List)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'phone': phone,
      };
}
