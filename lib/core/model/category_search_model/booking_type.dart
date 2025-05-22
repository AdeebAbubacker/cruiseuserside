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
  int? defaultPersons;
  int? minimumBed;
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
    this.defaultPersons,
    this.minimumBed,
  });

  factory BookingType.fromJson(Map<String, dynamic> json) => BookingType(
        id: json['id'] as int?,
        packageId: json['packageId'] as int?,
        name: json['name'] as String?,
        icon: json['icon'] as String?,
        bookingPriceRule: json['booking_price_rule'] as int?,
        pricePerPerson: json['pricePerPerson'] as String?,
        pricePerBed: json['pricePerBed'] as String?,
        pricePerDay: json['price_per_day'] as String?,
        defaultPrice: json['default_price'] as String?,
        comparePrice: json['comparePrice'] as String?,
        minAmountToPay: json['minAmountToPay'] as String?,
         defaultPersons: json['defaultPersons'] as int?,
        minimumBed: json['minimumBed'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'packageId': packageId,
        'name': name,
        'icon': icon,
        'booking_price_rule': bookingPriceRule,
        'pricePerPerson': pricePerPerson,
        'pricePerBed': pricePerBed,
        'price_per_day': pricePerDay,
        'default_price': defaultPrice,
        'comparePrice': comparePrice,
        'minAmountToPay': minAmountToPay,
        'defaultPersons': defaultPersons,
        'minimumBed': minimumBed,
      };
}
