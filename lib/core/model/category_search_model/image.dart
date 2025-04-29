class Image {
	int? id;
	int? packageId;
	String? packageImg;
	dynamic alt;

	Image({this.id, this.packageId, this.packageImg, this.alt});

	factory Image.fromJson(Map<String, dynamic> json) => Image(
				id: json['id'] as int?,
				packageId: json['packageId'] as int?,
				packageImg: json['packageImg'] as String?,
				alt: json['alt'] as dynamic,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'packageId': packageId,
				'packageImg': packageImg,
				'alt': alt,
			};
}
