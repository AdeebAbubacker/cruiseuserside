import 'booking.dart';

class BookingResponseModel {
  Booking? booking;
  bool? orderDetails;

  BookingResponseModel({this.booking, this.orderDetails});

  factory BookingResponseModel.fromJson(Map<String, dynamic> json) {
    return BookingResponseModel(
      booking: json['booking'] == null
          ? null
          : Booking.fromJson(json['booking'] as Map<String, dynamic>),
      orderDetails: json['orderDetails'] is bool
          ? json['orderDetails'] as bool
          : null, // Ignore if it's a Map or any other type
    );
  }

  Map<String, dynamic> toJson() => {
        'booking': booking?.toJson(),
        'orderDetails': orderDetails,
      };
}
