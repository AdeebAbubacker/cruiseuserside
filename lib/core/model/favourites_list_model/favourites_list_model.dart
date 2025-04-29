class FavouritesListModel {
  final List<Datum>? data;
  final Links? links;
  final Meta? meta;

  FavouritesListModel({
    this.data,
    this.links,
    this.meta,
  });

  factory FavouritesListModel.fromJson(Map<String, dynamic> json) =>
      FavouritesListModel(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e))
            .toList(),
        links: json['links'] != null ? Links.fromJson(json['links']) : null,
        meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
      );

 
}

class Datum {
  final int? id;
  final User? user;
  final Package? package;

  Datum({
    this.id,
    this.user,
    this.package,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        user: json['user'] != null ? User.fromJson(json['user']) : null,
        package:
            json['package'] != null ? Package.fromJson(json['package']) : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user': user?.toJson(),
        'package': package?.toJson(),
      };
}

class Package {
  final int? id;
  final String? name;
  final String? description;
  final bool? isActive;
  final int? cruiseId;
  final List<ImageModel>? images;
  final Cruise? cruise;
  final List<Amenity>? amenities;
  final List<Food>? food;
  final List<Itinerary>? itineraries;
  final List<BookingType>? bookingTypes;

  Package({
    this.id,
    this.name,
    this.description,
    this.isActive,
    this.cruiseId,
    this.images,
    this.cruise,
    this.amenities,
    this.food,
    this.itineraries,
    this.bookingTypes,
  });

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        id: json['id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        isActive: json['is_active'] as bool?,
        cruiseId: json['cruise_id'] as int?,
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => ImageModel.fromJson(e))
            .toList(),
        cruise: json['cruise'] != null ? Cruise.fromJson(json['cruise']) : null,
        amenities: (json['amenities'] as List<dynamic>?)
            ?.map((e) => Amenity.fromJson(e))
            .toList(),
        food: (json['food'] as List<dynamic>?)
            ?.map((e) => Food.fromJson(e))
            .toList(),
        itineraries: (json['itineraries'] as List<dynamic>?)
            ?.map((e) => Itinerary.fromJson(e))
            .toList(),
        bookingTypes: (json['booking_types'] as List<dynamic>?)
            ?.map((e) => BookingType.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'is_active': isActive,
        'cruise_id': cruiseId,
        'images': images?.map((e) => e.toJson()).toList(),
        'cruise': cruise?.toJson(),
        'amenities': amenities?.map((e) => e.toJson()).toList(),
        'food': food?.map((e) => e.toJson()).toList(),
        'itineraries': itineraries?.map((e) => e.toJson()).toList(),
        'booking_types': bookingTypes?.map((e) => e.toJson()).toList(),
      };
}

class Amenity {
  final int? id;
  final String? name;
  final String? icon;

  Amenity({
    this.id,
    this.name,
    this.icon,
  });

  factory Amenity.fromJson(Map<String, dynamic> json) => Amenity(
        id: json['id'] as int?,
        name: json['name'] as String?,
        icon: json['icon'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'icon': icon,
      };
}

class BookingType {
  final int? id;
  final int? packageId;
  final String? name;
  final String? icon;
  final int? bookingPriceRule;
  final String? pricePerPerson;
  final String? pricePerBed;
  final dynamic pricePerDay;
  final String? defaultPrice;
  final String? comparePrice;
  final String? minAmountToPay;

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
        id: json['id'] as int?,
        packageId: json['package_id'] as int?,
        name: json['name'] as String?,
        icon: json['icon'] as String?,
        bookingPriceRule: json['booking_price_rule'] as int?,
        pricePerPerson: json['price_per_person'] as String?,
        pricePerBed: json['price_per_bed'] as String?,
        pricePerDay: json['price_per_day'],
        defaultPrice: json['default_price'] as String?,
        comparePrice: json['compare_price'] as String?,
        minAmountToPay: json['min_amount_to_pay'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'package_id': packageId,
        'name': name,
        'icon': icon,
        'booking_price_rule': bookingPriceRule,
        'price_per_person': pricePerPerson,
        'price_per_bed': pricePerBed,
        'price_per_day': pricePerDay,
        'default_price': defaultPrice,
        'compare_price': comparePrice,
        'min_amount_to_pay': minAmountToPay,
      };
}

class Cruise {
  final int? id;
  final int? rooms;
  final int? maxCapacity;
  final String? description;
  final bool? isActive;
  final CruiseType? cruiseType;
  final List<Rating>? ratings;

  Cruise({
    this.id,
    this.rooms,
    this.maxCapacity,
    this.description,
    this.isActive,
    this.cruiseType,
    this.ratings,
  });

  factory Cruise.fromJson(Map<String, dynamic> json) => Cruise(
        id: json['id'] as int?,
        rooms: json['rooms'] as int?,
        maxCapacity: json['max_capacity'] as int?,
        description: json['description'] as String?,
        isActive: json['is_active'] as bool?,
        cruiseType: json['cruise_type'] != null
            ? CruiseType.fromJson(json['cruise_type'])
            : null,
        ratings: (json['ratings'] as List<dynamic>?)
            ?.map((e) => Rating.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'rooms': rooms,
        'max_capacity': maxCapacity,
        'description': description,
        'is_active': isActive,
        'cruise_type': cruiseType?.toJson(),
        'ratings': ratings?.map((e) => e.toJson()).toList(),
      };
}

class CruiseType {
  final int? id;
  final String? modelName;
  final String? type;
  final String? image;

  CruiseType({
    this.id,
    this.modelName,
    this.type,
    this.image,
  });

  factory CruiseType.fromJson(Map<String, dynamic> json) => CruiseType(
        id: json['id'] as int?,
        modelName: json['model_name'] as String?,
        type: json['type'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'model_name': modelName,
        'type': type,
        'image': image,
      };
}

class Rating {
  final int? id;
  final int? userId;
  final int? cruiseId;
  final int? rating;
  final String? description;

  Rating({
    this.id,
    this.userId,
    this.cruiseId,
    this.rating,
    this.description,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        cruiseId: json['cruise_id'] as int?,
        rating: json['rating'] as int?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'cruise_id': cruiseId,
        'rating': rating,
        'description': description,
      };
}

class Food {
  final int? id;
  final String? title;
  final String? description;
  final String? image;
  final bool? isVeg;
  final String? diningTime;

  Food({
    this.id,
    this.title,
    this.description,
    this.image,
    this.isVeg,
    this.diningTime,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json['id'] as int?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        image: json['image'] as String?,
        isVeg: json['is_veg'] as bool?,
        diningTime: json['dining_time'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'image': image,
        'is_veg': isVeg,
        'dining_time': diningTime,
      };
}

class ImageModel {
  final int? id;
  final int? packageId;
  final String? packageImg;
  final String? alt;

  ImageModel({
    this.id,
    this.packageId,
    this.packageImg,
    this.alt,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        id: json['id'] as int?,
        packageId: json['package_id'] as int?,
        packageImg: json['package_img'] as String?,
        alt: json['alt'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'package_id': packageId,
        'package_img': packageImg,
        'alt': alt,
      };
}

class Itinerary {
  final int? id;
  final int? packageId;
  final String? title;
  final String? time;
  final String? description;
  final bool? isActive;

  Itinerary({
    this.id,
    this.packageId,
    this.title,
    this.time,
    this.description,
    this.isActive,
  });

  factory Itinerary.fromJson(Map<String, dynamic> json) => Itinerary(
        id: json['id'] as int?,
        packageId: json['package_id'] as int?,
        title: json['title'] as String?,
        time: json['time'] as String?,
        description: json['description'] as String?,
        isActive: json['is_active'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'package_id': packageId,
        'title': title,
        'time': time,
        'description': description,
        'is_active': isActive,
      };
}

class User {
  final int? id;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? countryCode;

  User({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.countryCode,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        phoneNumber: json['phone_number'] as String?,
        countryCode: json['country_code'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone_number': phoneNumber,
        'country_code': countryCode,
      };
}

class Links {
  final String? first;
  final String? last;
  final dynamic prev;
  final dynamic next;

  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  // Factory constructor to create an instance of Links from JSON
  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      first: json['first'] as String?,
      last: json['last'] as String?,
      prev: json['prev'],
      next: json['next'],
    );
  }
}

class Meta {
  final int? currentPage;
  final int? from;
  final int? lastPage;
  final List<Link>? links;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

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

  // Factory constructor to create an instance of Meta from JSON
  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      currentPage: json['current_page'] as int?,
      from: json['from'] as int?,
      lastPage: json['last_page'] as int?,
      links: (json['links'] as List<dynamic>?)
          ?.map((linkJson) => Link.fromJson(linkJson))
          .toList(),
      path: json['path'] as String?,
      perPage: json['per_page'] as int?,
      to: json['to'] as int?,
      total: json['total'] as int?,
    );
  }


}

class Link {
  final String? url;
  final String? label;
  final bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  // Factory constructor to create an instance of Link from JSON
  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      url: json['url'] as String?,
      label: json['label'] as String?,
      active: json['active'] as bool?,
    );
  }
}
