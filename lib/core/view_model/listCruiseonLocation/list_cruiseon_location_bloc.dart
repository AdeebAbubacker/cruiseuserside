import 'package:bloc/bloc.dart';
import 'package:cruise_buddy/core/model/cruise_model/cruise_model.dart';
import 'package:cruise_buddy/core/services/package/packages_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_cruiseon_location_event.dart';
part 'list_cruiseon_location_state.dart';
part 'list_cruiseon_location_bloc.freezed.dart';

class ListCruiseonLocationBloc
    extends Bloc<ListCruiseonLocationEvent, ListCruiseonLocationState> {
  ListCruiseonLocationBloc() : super(_Initial()) {
    PackagesService packagesService = PackagesService();
    on<_GetCruise>((event, emit) async {
      emit(const ListCruiseonLocationState.loading());

      try {
        final result =
            await packagesService.getCruise(location: event.location);

        await result.fold((failure) async {
          if (failure == "No internet") {
            emit(const ListCruiseonLocationState.noInternet());
          } else {
            emit(ListCruiseonLocationState.getcruiseFailure(error: failure));
          }
        }, (success) async {
          emit(ListCruiseonLocationState.getcruiseuccess(cruisemodel: success));
        });
      } catch (e) {
        emit(ListCruiseonLocationState.getcruiseFailure(
            error: 'An error occurred: $e'));
      }
    });
  }
}
