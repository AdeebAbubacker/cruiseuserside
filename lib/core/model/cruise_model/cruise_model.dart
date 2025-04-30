// To parse this JSON data, do
//
//     final cruiseModel = cruiseModelFromJson(jsonString);

import 'dart:convert';

import 'package:cruise_buddy/core/model/featured_boats_model/featured_boats_model.dart';

CruiseModel cruiseModelFromJson(String str) =>
    CruiseModel.fromJson(json.decode(str));

String cruiseModelToJson(CruiseModel data) => json.encode(data.toJson());

class CruiseModel {
  List<Datum> data;
  Links links;
  Meta meta;

  CruiseModel({
    required this.data,
    required this.links,
    required this.meta,
  });

  factory CruiseModel.fromJson(Map<String, dynamic> json) => CruiseModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
      };
}

class Amenity {
  int id;
  String name;
  String icon;

  Amenity({
    required this.id,
    required this.name,
    required this.icon,
  });

  factory Amenity.fromJson(Map<String, dynamic> json) => Amenity(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
      };
}

class BookingType {
  int id;
  int packageId;
  String name;
  String icon;
  int bookingPriceRule;
  String pricePerPerson;
  String pricePerBed;
  String pricePerDay;
  String defaultPrice;
  String comparePrice;
  String minAmountToPay;

  BookingType({
    required this.id,
    required this.packageId,
    required this.name,
    required this.icon,
    required this.bookingPriceRule,
    required this.pricePerPerson,
    required this.pricePerBed,
    required this.pricePerDay,
    required this.defaultPrice,
    required this.comparePrice,
    required this.minAmountToPay,
  });

  factory BookingType.fromJson(Map<String, dynamic> json) => BookingType(
        id: json["id"],
        packageId: json["packageId"],
        name: json["name"],
        icon: json["icon"],
        bookingPriceRule: json["booking_price_rule"],
        pricePerPerson: json["pricePerPerson"],
        pricePerBed: json["pricePerBed"],
        pricePerDay: json["price_per_day"],
        defaultPrice: json["default_price"],
        comparePrice: json["comparePrice"],
        minAmountToPay: json["minAmountToPay"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "packageId": packageId,
        "name": name,
        "icon": icon,
        "booking_price_rule": bookingPriceRule,
        "pricePerPerson": pricePerPerson,
        "pricePerBed": pricePerBed,
        "price_per_day": pricePerDay,
        "default_price": defaultPrice,
        "comparePrice": comparePrice,
        "minAmountToPay": minAmountToPay,
      };
}

class Cruise {
  int id;
  String name;
  int rooms;
  int maxCapacity;
  String description;
  bool isActive;
  CruiseType cruiseType;
  List<CruiseImage> images;
  Location location;
  List<dynamic> ratings;

  Cruise({
    required this.id,
    required this.name,
    required this.rooms,
    required this.maxCapacity,
    required this.description,
    required this.isActive,
    required this.cruiseType,
    required this.images,
    required this.location,
    required this.ratings,
  });

  factory Cruise.fromJson(Map<String, dynamic> json) => Cruise(
        id: json["id"],
        name: json["name"],
        rooms: json["rooms"],
        maxCapacity: json["maxCapacity"],
        description: json["description"],
        isActive: json["isActive"],
        cruiseType: CruiseType.fromJson(json["cruiseType"]),
        images: List<CruiseImage>.from(
            json["images"].map((x) => CruiseImage.fromJson(x))),
        location: Location.fromJson(json["location"]),
        ratings: List<dynamic>.from(json["ratings"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "rooms": rooms,
        "maxCapacity": maxCapacity,
        "description": description,
        "isActive": isActive,
        "cruiseType": cruiseType.toJson(),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "location": location.toJson(),
        "ratings": List<dynamic>.from(ratings.map((x) => x)),
      };
}

class CruiseType {
  int id;
  String modelName;
  String type;
  String image;

  CruiseType({
    required this.id,
    required this.modelName,
    required this.type,
    required this.image,
  });

  factory CruiseType.fromJson(Map<String, dynamic> json) => CruiseType(
        id: json["id"],
        modelName: json["modelName"],
        type: json["type"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "modelName": modelName,
        "type": type,
        "image": image,
      };
}

class CruiseImage {
  int id;
  int cruiseId;
  String cruiseImg;
  dynamic alt;

  CruiseImage({
    required this.id,
    required this.cruiseId,
    required this.cruiseImg,
    required this.alt,
  });

  factory CruiseImage.fromJson(Map<String, dynamic> json) => CruiseImage(
        id: json["id"],
        cruiseId: json["cruiseId"],
        cruiseImg: json["cruiseImg"],
        alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cruiseId": cruiseId,
        "cruiseImg": cruiseImg,
        "alt": alt,
      };
}

class Location {
  int id;
  String name;
  String district;
  String state;
  String country;
  String thumbnail;
  String mapUrl;

  Location({
    required this.id,
    required this.name,
    required this.district,
    required this.state,
    required this.country,
    required this.thumbnail,
    required this.mapUrl,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        name: json["name"],
        district: json["district"],
        state: json["state"],
        country: json["country"],
        thumbnail: json["thumbnail"],
        mapUrl: json["mapUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "district": district,
        "state": state,
        "country": country,
        "thumbnail": thumbnail,
        "mapUrl": mapUrl,
      };
}

class DatumImage {
  int id;
  int packageId;
  String packageImg;
  dynamic alt;

  DatumImage({
    required this.id,
    required this.packageId,
    required this.packageImg,
    required this.alt,
  });

  factory DatumImage.fromJson(Map<String, dynamic> json) => DatumImage(
        id: json["id"],
        packageId: json["packageId"],
        packageImg: json["packageImg"],
        alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "packageId": packageId,
        "packageImg": packageImg,
        "alt": alt,
      };
}

class Links {
  String first;
  String last;
  dynamic prev;
  dynamic next;

  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  int currentPage;
  int from;
  int lastPage;
  List<Link> links;
  String path;
  int perPage;
  int to;
  int total;

  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}

class Link {
  String? url;
  String label;
  bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
