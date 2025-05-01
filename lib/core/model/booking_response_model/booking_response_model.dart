class BookingResponseModel {
  final Booking? booking;
  final bool? orderDetails;

  BookingResponseModel({this.booking, this.orderDetails});

  factory BookingResponseModel.fromJson(Map<String, dynamic> json) {
    return BookingResponseModel(
      booking:
          json['booking'] != null ? Booking.fromJson(json['booking']) : null,
      orderDetails: json['orderDetails'],
    );
  }
}

class Booking {
  final int? id;
  final String? invoiceId;
  final int? orderId;
  final int? userId;
  final int? cruiseId;
  final int? packageId;
  final int? bookingTypeId;
  final int? vegCount;
  final int? nonVegCount;
  final int? jainVegCount;
  final double? totalAmount;
  final double? amountPaid;
  final double? balanceAmount;
  final String? customerNote;
  final String? startDate;
  final String? endDate;
  final String? fulfillmentStatus;
  final bool? bookedByUser;
  final bool? isActive;

  Booking({
    this.id,
    this.invoiceId,
    this.orderId,
    this.userId,
    this.cruiseId,
    this.packageId,
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

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      invoiceId: json['invoice_id'],
      orderId: json['orderId'],
      userId: json['userId'],
      cruiseId: json['cruise_id'],
      packageId: json['packageId'],
      bookingTypeId: json['bookingTypeId'],
      vegCount: json['vegCount'],
      nonVegCount: json['nonVegCount'],
      jainVegCount: json['jainVegCount'],
      totalAmount: json['totalAmount'] != null
          ? (json['totalAmount'] is int
              ? json['totalAmount'].toDouble()
              : json['totalAmount'])
          : null,
      amountPaid: json['amountPaid'] != null
          ? (json['amountPaid'] is int
              ? json['amountPaid'].toDouble()
              : json['amountPaid'])
          : null,
      balanceAmount: json['balanceAmount'] != null
          ? (json['balanceAmount'] is int
              ? json['balanceAmount'].toDouble()
              : json['balanceAmount'])
          : null,
      customerNote: json['customerNote'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      fulfillmentStatus: json['fulfillmentStatus'],
      bookedByUser: json['bookedByUser'],
      isActive: json['isActive'],
    );
  }
}
