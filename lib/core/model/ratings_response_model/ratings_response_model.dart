class RatingsResponseModel {
  RatingsResponseModel({
    required this.rating,
  });

  final Rating? rating;

  RatingsResponseModel copyWith({
    Rating? rating,
  }) {
    return RatingsResponseModel(
      rating: rating ?? this.rating,
    );
  }

  factory RatingsResponseModel.fromJson(Map<String, dynamic> json) {
    return RatingsResponseModel(
      rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "rating": rating?.toJson(),
      };
}

class Rating {
  Rating({
    required this.id,
    required this.userId,
    required this.cruiseId,
    required this.rating,
    required this.description,
  });

  final int id;
  final int userId;
  final int cruiseId;
  final int rating;
  final String description;

  Rating copyWith({
    int? id,
    int? userId,
    int? cruiseId,
    int? rating,
    String? description,
  }) {
    return Rating(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      cruiseId: cruiseId ?? this.cruiseId,
      rating: rating ?? this.rating,
      description: description ?? this.description,
    );
  }

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      id: json["id"] ?? 0,
      userId: json["userId"] ?? 0,
      cruiseId: json["cruiseId"] ?? 0,
      rating: json["rating"] ?? 0,
      description: json["description"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "cruiseId": cruiseId,
        "rating": rating,
        "description": description,
      };
}
