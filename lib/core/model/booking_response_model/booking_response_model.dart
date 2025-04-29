import 'booking.dart';
import 'order_details.dart';

class BookingResponseModel {
	Booking? booking;
	OrderDetails? orderDetails;

	BookingResponseModel({this.booking, this.orderDetails});

	factory BookingResponseModel.fromJson(Map<String, dynamic> json) {
		return BookingResponseModel(
			booking: json['booking'] == null
						? null
						: Booking.fromJson(json['booking'] as Map<String, dynamic>),
			orderDetails: json['orderDetails'] == null
						? null
						: OrderDetails.fromJson(json['orderDetails'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'booking': booking?.toJson(),
				'orderDetails': orderDetails?.toJson(),
			};
}
