class LoginValidation {
  String? message;
  Errors? errors;

  LoginValidation({this.message, this.errors});

  factory LoginValidation.fromJson(Map<String, dynamic> json) {
    return LoginValidation(
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
  List<String>? email;
  List<String>? password;

  Errors({this.email, this.password});

  factory Errors.fromJson(Map<String, dynamic> json) {
    return Errors(
      email: json['email'] != null
          ? List<String>.from(json['email'] as List)
          : null,
      password: json['password'] != null
          ? List<String>.from(json['password'] as List)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}
