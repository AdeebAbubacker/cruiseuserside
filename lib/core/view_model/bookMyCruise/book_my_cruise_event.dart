part of 'book_my_cruise_bloc.dart';

@freezed
class BookMyCruiseEvent with _$BookMyCruiseEvent {
  const factory BookMyCruiseEvent.started() = _Started;
  const factory BookMyCruiseEvent.createNewbookings({
    required String packageId,
    required String bookingtype,
    required String startdate,
    String? endDate,
    String? vegCount,
    String? nonVegCount,
    String? jainVegCount,
    String? totalAmount,
    String? customerNotet,
  }) = _BookMyCruiseEventboats;
}
