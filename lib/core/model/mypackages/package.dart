class Package {
  int? id;
  int? cruiseId;
  String? name;
  String? description;
  String? slug;
  bool? isActive;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  Package({
    this.id,
    this.cruiseId,
    this.name,
    this.description,
    this.slug,
    this.isActive,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        id: json['id'] as int?,
        cruiseId: json['cruise_id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        slug: json['slug'] as String?,
        isActive: json['is_active'] as bool?,
        deletedAt: json['deleted_at'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'cruise_id': cruiseId,
        'name': name,
        'description': description,
        'slug': slug,
        'is_active': isActive,
        'deleted_at': deletedAt,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
