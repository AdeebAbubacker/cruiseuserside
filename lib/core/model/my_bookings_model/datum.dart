import 'package.dart';

class Datum {
  int? id;
  String? invoiceId;
  String? orderId;
  int? userId;
  dynamic cruiseId;
  int? packageId;
  Package? package;
  int? bookingTypeId;
  int? vegCount;
  int? nonVegCount;
  int? jainVegCount;
  int? totalAmount;
  dynamic amountPaid;
  int? balanceAmount;
  String? customerNote;
  String? startDate;
  String? endDate;
  String? fulfillmentStatus;
  bool? bookedByUser;
  bool? isActive;

  Datum({
    this.id,
    this.invoiceId,
    this.orderId,
    this.userId,
    this.cruiseId,
    this.packageId,
    this.package,
    this.bookingTypeId,
    this.vegCount,
    this.nonVegCount,
    this.jainVegCount,
    this.totalAmount,
    this.amountPaid,
    this.balanceAmount,
    this.customerNote,
    this.startDate,
    this.endDate,
    this.fulfillmentStatus,
    this.bookedByUser,
    this.isActive,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        invoiceId: json['invoice_id'] as String?,
        orderId: json['orderId'] as String?,
        userId: json['userId'] as int?,
        cruiseId: json['cruise_id'] as dynamic,
        packageId: json['packageId'] as int?,
        package: json['package'] == null
            ? null
            : Package.fromJson(json['package'] as Map<String, dynamic>),
        bookingTypeId: json['bookingTypeId'] as int?,
        vegCount: json['vegCount'] as int?,
        nonVegCount: json['nonVegCount'] as int?,
        jainVegCount: json['jainVegCount'] as int?,
        totalAmount: json['totalAmount'] as int?,
        amountPaid: json['amountPaid'] as dynamic,
        balanceAmount: json['balanceAmount'] as int?,
        customerNote: json['customerNote'] as String?,
        startDate: json['startDate'] as String?,
        endDate: json['endDate'] as String?,
        fulfillmentStatus: json['fulfillmentStatus'] as String?,
        bookedByUser: json['bookedByUser'] as bool?,
        isActive: json['isActive'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'invoice_id': invoiceId,
        'orderId': orderId,
        'userId': userId,
        'cruise_id': cruiseId,
        'packageId': packageId,
        'package': package?.toJson(),
        'bookingTypeId': bookingTypeId,
        'vegCount': vegCount,
        'nonVegCount': nonVegCount,
        'jainVegCount': jainVegCount,
        'totalAmount': totalAmount,
        'amountPaid': amountPaid,
        'balanceAmount': balanceAmount,
        'customerNote': customerNote,
        'startDate': startDate,
        'endDate': endDate,
        'fulfillmentStatus': fulfillmentStatus,
        'bookedByUser': bookedByUser,
        'isActive': isActive,
      };
}
