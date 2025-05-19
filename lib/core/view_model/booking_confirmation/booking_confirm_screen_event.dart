part of 'booking_confirm_screen_bloc.dart';

@freezed
class BookingConfirmScreenEvent with _$BookingConfirmScreenEvent {
  const factory BookingConfirmScreenEvent.started() = _Started;
  const factory BookingConfirmScreenEvent.updateAdults(int numAdults) =
      _UpdateAdults;
  const factory BookingConfirmScreenEvent.updateBookingType(
      String bookingTypeId) = _UpdateBookingType;
  const factory BookingConfirmScreenEvent.updateDefaultPrice(int defaultPrice) =
      _UpdateDefaultPrice;
  const factory BookingConfirmScreenEvent.updatePricePerPerson(
      int pricePerPerson) = _UpdatePricePerPerson;
  const factory BookingConfirmScreenEvent.togglePassengerEdit() =
      _TogglePassengerEdit;
  const factory BookingConfirmScreenEvent.calculateTotalPrice() =
      _CalculateTotalPrice;
}
