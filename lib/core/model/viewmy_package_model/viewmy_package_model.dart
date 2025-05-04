import 'package:cruise_buddy/core/model/featured_boats_model/featured_boats_model.dart'
    as featuredBoats;
import 'data.dart';

class ViewmyPackageModel {
  Data? data;
  List<featuredBoats.UnavailableDate>? unavailableDate;
  ViewmyPackageModel({
    this.data,
    this.unavailableDate,
  });

  factory ViewmyPackageModel.fromJson(Map<String, dynamic> json) {
    return ViewmyPackageModel(
      data: json['package'] == null
          ? null
          : Data.fromJson(json['package'] as Map<String, dynamic>),
      unavailableDate: (json['unavailable_dates'] as List<dynamic>?)
          ?.map((e) =>
              featuredBoats.UnavailableDate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'unavailable_dates': unavailableDate?.map((e) => e.toJson()).toList(),
      };
}
