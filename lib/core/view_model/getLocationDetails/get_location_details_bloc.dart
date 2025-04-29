import 'package:bloc/bloc.dart';
import 'package:cruise_buddy/core/model/location_model/location_model.dart';
import 'package:cruise_buddy/core/services/location/location_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_location_details_event.dart';
part 'get_location_details_state.dart';
part 'get_location_details_bloc.freezed.dart';

class GetLocationDetailsBloc
    extends Bloc<GetLocationDetailsEvent, GetLocationDetailsState> {
  GetLocationDetailsBloc() : super(_Initial()) {
    LocationService locationService = LocationService();
    on<_GetLocation>((event, emit) async {
      emit(const GetLocationDetailsState.loading());

      try {
        final result = await locationService.getLocationDetails(
          locationName: event.locationName,
        );

        await result.fold((failure) async {
          if (failure == "No internet") {
            emit(const GetLocationDetailsState.noInternet());
          } else {
            emit(GetLocationDetailsState.getlocationsFailure(error: failure));
          }
        }, (success) async {
          emit(GetLocationDetailsState.getLocationDetails(
              locationmodel: success));
        });
      } catch (e) {
        emit(GetLocationDetailsState.getlocationsFailure(
            error: 'An error occurred: $e'));
      }
    });
  }
}
