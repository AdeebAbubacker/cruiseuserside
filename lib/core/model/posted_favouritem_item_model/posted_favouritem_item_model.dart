import 'favorite.dart';

class PostedFavouritemItemModel {
  Favorite? favorite;

  PostedFavouritemItemModel({this.favorite});

  factory PostedFavouritemItemModel.fromJson(Map<String, dynamic> json) {
    return PostedFavouritemItemModel(
      favorite: json['favorite'] == null
          ? null
          : Favorite.fromJson(json['favorite'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'favorite': favorite?.toJson(),
      };
}
