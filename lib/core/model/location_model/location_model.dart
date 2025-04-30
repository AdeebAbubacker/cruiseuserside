class LocationModel {
  final List<LocationData>? data;
  final PaginationLinks? links;
  final MetaData? meta;

  LocationModel({
    this.data,
    this.links,
    this.meta,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      data: (json['data'] as List<dynamic>? ?? [])
          .map((e) => LocationData.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: json['links'] != null
          ? PaginationLinks.fromJson(json['links'] as Map<String, dynamic>)
          : null,
      meta: json['meta'] != null
          ? MetaData.fromJson(json['meta'] as Map<String, dynamic>)
          : null,
    );
  }
}

class LocationData {
  final int? id;
  final String? name;
  final String? district;
  final String? state;
  final String? country;
  final String? thumbnail;
  final String? mapUrl;

  LocationData({
    this.id,
    this.name,
    this.district,
    this.state,
    this.country,
    this.thumbnail,
    this.mapUrl,
  });

  factory LocationData.fromJson(Map<String, dynamic> json) {
    return LocationData(
      id: json['id'] as int?,
      name: json['name'] as String?,
      district: json['district'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      thumbnail: json['thumbnail'] as String?,
      mapUrl: json['mapUrl'] as String?,
    );
  }
}

class PaginationLinks {
  final String? first;
  final String? last;
  final String? prev;
  final String? next;

  PaginationLinks({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  factory PaginationLinks.fromJson(Map<String, dynamic> json) {
    return PaginationLinks(
      first: json['first'] as String?,
      last: json['last'] as String?,
      prev: json['prev'] as String?,
      next: json['next'] as String?,
    );
  }
}

class MetaLinks {
  final String? url;
  final String? label;
  final bool? active;

  MetaLinks({
    this.url,
    this.label,
    this.active,
  });

  factory MetaLinks.fromJson(Map<String, dynamic> json) {
    return MetaLinks(
      url: json['url'] as String?,
      label: json['label'] as String?,
      active: json['active'] as bool?,
    );
  }
}

class MetaData {
  final int? currentPage;
  final int? from;
  final int? lastPage;
  final List<MetaLinks>? links;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

  MetaData({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) {
    return MetaData(
      currentPage: json['current_page'] as int?,
      from: json['from'] as int?,
      lastPage: json['last_page'] as int?,
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => MetaLinks.fromJson(e as Map<String, dynamic>))
          .toList(),
      path: json['path'] as String?,
      perPage: json['per_page'] as int?,
      to: json['to'] as int?,
      total: json['total'] as int?,
    );
  }
}
