class RegsiterValidation {
  String? message;
  Errors? errors;

  RegsiterValidation({this.message, this.errors});

  factory RegsiterValidation.fromJson(Map<String, dynamic> json) {
    return RegsiterValidation(
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
  List<String>? name;
  List<String>? email;
  List<String>? phoneNumber;
  List<String>? password;
  List<String>? password_confirmation;

  Errors({
    this.email,
    this.password,
    this.name,
    this.password_confirmation,
    this.phoneNumber,
  });

  factory Errors.fromJson(Map<String, dynamic> json) {
    return Errors(
      name:
          json['name'] != null ? List<String>.from(json['name'] as List) : null,
      email: json['email'] != null
          ? List<String>.from(json['email'] as List)
          : null,
      phoneNumber: json['phoneNumber'] != null
          ? List<String>.from(json['phoneNumber'] as List)
          : null,
      password: json['password'] != null
          ? List<String>.from(json['password'] as List)
          : null,
      password_confirmation: json['password_confirmation'] != null
          ? List<String>.from(json['password_confirmation'] as List)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'phoneNumber': phoneNumber,
        'password_confirmation': password_confirmation,
      };
}
