part of 'see_allmy_bookings_bloc.dart';

@freezed
class SeeAllmyBookingsEvent with _$SeeAllmyBookingsEvent {
  const factory SeeAllmyBookingsEvent.started() = _Started;
  const factory SeeAllmyBookingsEvent.seeMyBooking() = _seeMyBooking;
}
