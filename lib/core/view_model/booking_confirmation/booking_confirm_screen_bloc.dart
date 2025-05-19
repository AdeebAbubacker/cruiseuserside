import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_confirm_screen_event.dart';
part 'booking_confirm_screen_state.dart';
part 'booking_confirm_screen_bloc.freezed.dart';

class BookingConfirmScreenBloc
    extends Bloc<BookingConfirmScreenEvent, BookingConfirmScreenState> {
  BookingConfirmScreenBloc() : super(const BookingConfirmScreenState()) {
    on<_UpdateBookingType>((event, emit) {
      emit(BookingConfirmScreenState(bookingTypeId: 'f'));
    });
  }
}
