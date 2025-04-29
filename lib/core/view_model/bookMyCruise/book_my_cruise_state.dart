part of 'book_my_cruise_bloc.dart';

@freezed
class BookMyCruiseState with _$BookMyCruiseState {
  const factory BookMyCruiseState.initial() = _Initial;
  const factory BookMyCruiseState.loading() = _Loading;
  const factory BookMyCruiseState.getBookedBoats(
      {required BookingResponseModel bookingresponse}) = _GetBookedBoats;

  const factory BookMyCruiseState.getBookedFailure({required String error}) =
      GetBookedFailure;
  const factory BookMyCruiseState.noInternet() = _NoInternet;
}
