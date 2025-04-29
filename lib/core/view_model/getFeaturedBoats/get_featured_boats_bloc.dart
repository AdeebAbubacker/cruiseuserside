import 'package:bloc/bloc.dart';
import 'package:cruise_buddy/core/model/featured_boats_model/featured_boats_model.dart';
import 'package:cruise_buddy/core/services/cruise/cruise_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_featured_boats_event.dart';
part 'get_featured_boats_state.dart';
part 'get_featured_boats_bloc.freezed.dart';

class GetFeaturedBoatsBloc
    extends Bloc<GetFeaturedBoatsEvent, GetFeaturedBoatsState> {
  GetFeaturedBoatsBloc() : super(_Initial()) {
    CruiseService locationService = CruiseService();
    on<_GetFeaturedBoats>((event, emit) async {
      emit(const GetFeaturedBoatsState.loading());

      try {
        final result = await locationService.getFeaturedBoats();

        await result.fold((failure) async {
          if (failure == "No internet") {
            emit(const GetFeaturedBoatsState.noInternet());
          } else {
            emit(GetFeaturedBoatsState.getFeaturedBoatsFailure(error: failure));
          }
        }, (success) async {
          emit(
            GetFeaturedBoatsState.getFeaturedBoats(
              featuredBoats: success,
            ),
          );
        });
      } catch (e) {
        emit(GetFeaturedBoatsState.getFeaturedBoatsFailure(
            error: 'An error occurred: $e'));
      }
    });
  }
}
