import 'package:hive_flutter/hive_flutter.dart';
part 'user_details_adapter.g.dart';

@HiveType(typeId: 1)
class UserDetailsDB {
  @HiveField(0)
  dynamic name;
  @HiveField(1)
  String email;
  @HiveField(2)
  dynamic phone;
  @HiveField(3)
  dynamic image;

  UserDetailsDB({
    this.name,
    this.email = '',
    this.phone,
    this.image = '',
  });

  factory UserDetailsDB.fromJson(Map<String, dynamic> json) {
    return UserDetailsDB(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['image'] = image;

    return data;
  }
}
