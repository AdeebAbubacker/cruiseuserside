import 'package:bloc/bloc.dart';
import 'package:cruise_buddy/core/model/my_bookings_model/my_bookings_model.dart';
import 'package:cruise_buddy/core/services/book/booking_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'see_allmy_bookings_event.dart';
part 'see_allmy_bookings_state.dart';
part 'see_allmy_bookings_bloc.freezed.dart';

class SeeAllmyBookingsBloc
    extends Bloc<SeeAllmyBookingsEvent, SeeAllmyBookingsState> {
  SeeAllmyBookingsBloc() : super(_Initial()) {
    BookingService bookingService = BookingService();
    on<_seeMyBooking>((event, emit) async {
      emit(const SeeAllmyBookingsState.loading());

      try {
        final result = await bookingService.getMyBookings();

        await result.fold((failure) async {
          if (failure == "No internet") {
            emit(const SeeAllmyBookingsState.noInternet());
          } else {
            emit(SeeAllmyBookingsState.getuserFailure(error: failure));
          }
        }, (success) async {
          emit(SeeAllmyBookingsState.getuseruccess(mybookingmodel: success));
        });
      } catch (e) {
        emit(SeeAllmyBookingsState.getuserFailure(
            error: 'An error occurred: $e'));
      }
    });
  }
}
