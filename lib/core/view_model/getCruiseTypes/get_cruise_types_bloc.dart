import 'package:bloc/bloc.dart';
import 'package:cruise_buddy/core/model/cruise_type_model/cruise_type_model.dart';
import 'package:cruise_buddy/core/services/cruise/cruise_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_cruise_types_event.dart';
part 'get_cruise_types_state.dart';
part 'get_cruise_types_bloc.freezed.dart';

class GetCruiseTypesBloc
    extends Bloc<GetCruiseTypesEvent, GetCruiseTypesState> {
  GetCruiseTypesBloc() : super(_Initial()) {
    CruiseService locationService = CruiseService();
    on<_GetCruiseTypes>((event, emit) async {
      emit(const GetCruiseTypesState.loading());

      try {
        final result = await locationService.getCruiseTypes();

        await result.fold((failure) async {
          if (failure == "No internet") {
            emit(const GetCruiseTypesState.noInternet());
          } else {
            emit(GetCruiseTypesState.getCruiseTypesFailure(error: failure));
          }
        }, (success) async {
          emit(
            GetCruiseTypesState.getCruiseTypes(
              cruisetypemodel: success,
            ),
          );
        });
      } catch (e) {
        emit(GetCruiseTypesState.getCruiseTypesFailure(
            error: 'An error occurred: $e'));
      }
    });
  }
}
