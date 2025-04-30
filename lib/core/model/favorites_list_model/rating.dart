class Rating {
  int? id;
  int? userId;
  int? cruiseId;
  int? rating;
  String? description;

  Rating({
    this.id,
    this.userId,
    this.cruiseId,
    this.rating,
    this.description,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        id: json['id'] as int?,
        userId: json['userId'] as int?,
        cruiseId: json['cruiseId'] as int?,
        rating: json['rating'] as int?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'cruiseId': cruiseId,
        'rating': rating,
        'description': description,
      };
}
