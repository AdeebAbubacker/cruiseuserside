part of 'see_allmy_bookings_bloc.dart';

@freezed
class SeeAllmyBookingsState with _$SeeAllmyBookingsState {
  const factory SeeAllmyBookingsState.initial() = _Initial;
  const factory SeeAllmyBookingsState.loading() = _Loading;
  const factory SeeAllmyBookingsState.getuseruccess(
      {required MyBookingsModel mybookingmodel}) = _MyBookingModel;

  const factory SeeAllmyBookingsState.getuserFailure({required String error}) =
      GetuserFailure;
  const factory SeeAllmyBookingsState.noInternet() = _NoInternet;
}
