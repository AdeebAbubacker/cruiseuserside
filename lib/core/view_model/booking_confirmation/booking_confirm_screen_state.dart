part of 'booking_confirm_screen_bloc.dart';

@freezed
class BookingConfirmScreenState with _$BookingConfirmScreenState {
  const factory BookingConfirmScreenState.initial() = _Initial;
  const factory BookingConfirmScreenState({
    @Default(1) int numAdults,
    @Default(0) int numKids,
    @Default('1') String bookingTypeId,
    @Default(0) int defaultPrice,
    @Default(0) int pricePerPerson,
    @Default(0) int totalPrice,
    @Default(false) bool isEditingPassengers,
  }) = _BookingConfirmScreenState;
}
