// To parse this JSON data, do
//
//     final featuredBoatsModel = featuredBoatsModelFromJson(jsonString);

import 'dart:convert';

FeaturedBoatsModel featuredBoatsModelFromJson(String str) => FeaturedBoatsModel.fromJson(json.decode(str));

String featuredBoatsModelToJson(FeaturedBoatsModel data) => json.encode(data.toJson());

class FeaturedBoatsModel {
    List<Datum>? data;
    Links? links;
    Meta? meta;

    FeaturedBoatsModel({
        this.data,
        this.links,
        this.meta,
    });

    factory FeaturedBoatsModel.fromJson(Map<String, dynamic> json) => FeaturedBoatsModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links?.toJson(),
        "meta": meta?.toJson(),
    };
}

class Datum {
    int? id;
    String? name;
    String? description;
    bool? isActive;
    int? cruiseId;
    String? avgRating;
    List<DatumImage>? images;
    Cruise? cruise;
    List<Amenity>? amenities;
    List<dynamic>? food;
    List<dynamic>? itineraries;
    List<BookingType>? bookingTypes;
    List<UnavailableDate>? unavailableDate;

    Datum({
        this.id,
        this.name,
        this.description,
        this.isActive,
        this.cruiseId,
        this.avgRating,
        this.images,
        this.cruise,
        this.amenities,
        this.food,
        this.itineraries,
        this.bookingTypes,
        this.unavailableDate,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        isActive: json["isActive"],
        cruiseId: json["cruiseId"],
        avgRating: json["avgRating"],
        images: json["images"] == null ? [] : List<DatumImage>.from(json["images"]!.map((x) => DatumImage.fromJson(x))),
        cruise: json["cruise"] == null ? null : Cruise.fromJson(json["cruise"]),
        amenities: json["amenities"] == null ? [] : List<Amenity>.from(json["amenities"]!.map((x) => Amenity.fromJson(x))),
        food: json["food"] == null ? [] : List<dynamic>.from(json["food"]!.map((x) => x)),
        itineraries: json["itineraries"] == null ? [] : List<dynamic>.from(json["itineraries"]!.map((x) => x)),
        bookingTypes: json["bookingTypes"] == null ? [] : List<BookingType>.from(json["bookingTypes"]!.map((x) => BookingType.fromJson(x))),
        unavailableDate: json["unavailableDate"] == null ? [] : List<UnavailableDate>.from(json["unavailableDate"]!.map((x) => UnavailableDate.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "isActive": isActive,
        "cruiseId": cruiseId,
        "avgRating": avgRating,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
        "cruise": cruise?.toJson(),
        "amenities": amenities == null ? [] : List<dynamic>.from(amenities!.map((x) => x.toJson())),
        "food": food == null ? [] : List<dynamic>.from(food!.map((x) => x)),
        "itineraries": itineraries == null ? [] : List<dynamic>.from(itineraries!.map((x) => x)),
        "bookingTypes": bookingTypes == null ? [] : List<dynamic>.from(bookingTypes!.map((x) => x.toJson())),
        "unavailableDate": unavailableDate == null ? [] : List<dynamic>.from(unavailableDate!.map((x) => x.toJson())),
    };
}

class Amenity {
    int? id;
    String? name;
    String? icon;

    Amenity({
        this.id,
        this.name,
        this.icon,
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
    int? id;
    int? packageId;
    String? name;
    String? icon;
    int? bookingPriceRule;
    String? pricePerPerson;
    String? pricePerBed;
    String? pricePerDay;
    String? defaultPrice;
    String? comparePrice;
    String? minAmountToPay;

    BookingType({
        this.id,
        this.packageId,
        this.name,
        this.icon,
        this.bookingPriceRule,
        this.pricePerPerson,
        this.pricePerBed,
        this.pricePerDay,
        this.defaultPrice,
        this.comparePrice,
        this.minAmountToPay,
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
    int? id;
    String? name;
    int? rooms;
    int? maxCapacity;
    String? description;
    bool? isActive;
    CruiseType? cruiseType;
    List<CruiseImage>? images;
    Location? location;
    List<Rating>? ratings;

    Cruise({
        this.id,
        this.name,
        this.rooms,
        this.maxCapacity,
        this.description,
        this.isActive,
        this.cruiseType,
        this.images,
        this.location,
        this.ratings,
    });

    factory Cruise.fromJson(Map<String, dynamic> json) => Cruise(
        id: json["id"],
        name: json["name"],
        rooms: json["rooms"],
        maxCapacity: json["maxCapacity"],
        description: json["description"],
        isActive: json["isActive"],
        cruiseType: json["cruiseType"] == null ? null : CruiseType.fromJson(json["cruiseType"]),
        images: json["images"] == null ? [] : List<CruiseImage>.from(json["images"]!.map((x) => CruiseImage.fromJson(x))),
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
        ratings: json["ratings"] == null ? [] : List<Rating>.from(json["ratings"]!.map((x) => Rating.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "rooms": rooms,
        "maxCapacity": maxCapacity,
        "description": description,
        "isActive": isActive,
        "cruiseType": cruiseType?.toJson(),
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
        "location": location?.toJson(),
        "ratings": ratings == null ? [] : List<dynamic>.from(ratings!.map((x) => x.toJson())),
    };
}

class CruiseType {
    int? id;
    String? modelName;
    String? type;
    String? image;

    CruiseType({
        this.id,
        this.modelName,
        this.type,
        this.image,
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
    int? id;
    int? cruiseId;
    String? cruiseImg;
    dynamic alt;

    CruiseImage({
        this.id,
        this.cruiseId,
        this.cruiseImg,
        this.alt,
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
    int? id;
    String? name;
    String? district;
    String? state;
    String? country;
    String? thumbnail;
    String? mapUrl;

    Location({
        this.id,
        this.name,
        this.district,
        this.state,
        this.country,
        this.thumbnail,
        this.mapUrl,
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
        id: json["id"],
        userId: json["userId"],
        cruiseId: json["cruiseId"],
        rating: json["rating"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "cruiseId": cruiseId,
        "rating": rating,
        "description": description,
    };
}

class DatumImage {
    int? id;
    int? packageId;
    String? packageImg;
    dynamic alt;

    DatumImage({
        this.id,
        this.packageId,
        this.packageImg,
        this.alt,
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

class UnavailableDate {
    DateTime? startDate;
    DateTime? endDate;

    UnavailableDate({
        this.startDate,
        this.endDate,
    });

    factory UnavailableDate.fromJson(Map<String, dynamic> json) => UnavailableDate(
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
    );

    Map<String, dynamic> toJson() => {
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
    };
}

class Links {
    String? first;
    String? last;
    dynamic prev;
    String? next;

    Links({
        this.first,
        this.last,
        this.prev,
        this.next,
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
    int? currentPage;
    int? from;
    int? lastPage;
    List<Link>? links;
    String? path;
    int? perPage;
    int? to;
    int? total;

    Meta({
        this.currentPage,
        this.from,
        this.lastPage,
        this.links,
        this.path,
        this.perPage,
        this.to,
        this.total,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
    };
}

class Link {
    String? url;
    String? label;
    bool? active;

    Link({
        this.url,
        this.label,
        this.active,
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
