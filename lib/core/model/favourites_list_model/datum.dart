import 'package.dart';
import 'user.dart';

class Datum {
	int? id;
	User? user;
	Package? package;

	Datum({this.id, this.user, this.package});

	factory Datum.fromJson(Map<String, dynamic> json) => Datum(
				id: json['id'] as int?,
				user: json['user'] == null
						? null
						: User.fromJson(json['user'] as Map<String, dynamic>),
				package: json['package'] == null
						? null
						: Package.fromJson(json['package'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'user': user?.toJson(),
				'package': package?.toJson(),
			};
}
