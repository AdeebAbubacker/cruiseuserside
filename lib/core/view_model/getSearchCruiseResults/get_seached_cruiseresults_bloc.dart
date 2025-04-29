import 'package:bloc/bloc.dart';
import 'package:cruise_buddy/core/model/categories_results_model/categories_results_model.dart';
import 'package:cruise_buddy/core/model/category_search_model/category_search_model.dart';
import 'package:cruise_buddy/core/services/cruise/cruise_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_seached_cruiseresults_event.dart';
part 'get_seached_cruiseresults_state.dart';
part 'get_seached_cruiseresults_bloc.freezed.dart';

class GetSeachedCruiseresultsBloc
    extends Bloc<GetSeachedCruiseresultsEvent, GetSeachedCruiseresultsState> {
  GetSeachedCruiseresultsBloc() : super(_Initial()) {
    CruiseService userService = CruiseService();
    on<_GetSeachedCruiseresultsEvent>((event, emit) async {
      emit(const GetSeachedCruiseresultsState.loading());

      try {
        final result = await userService.getSearchResultsList(
          filterCriteria: event.filterCriteria,
          location: event.location,
          maxAmount: event.maxAmount,
          minAmount: event.minAmount,
        );

        await result.fold((failure) async {
          if (failure == "No internet") {
            print('No interne');
            emit(const GetSeachedCruiseresultsState.noInternet());
          } else {
            emit(GetSeachedCruiseresultsState.getuserFailure(error: failure));
          }
        }, (success) async {
          emit(GetSeachedCruiseresultsState.getuseruccess(
              packagesearchresults: success));
        });
      } catch (e) {
        print('catch');
        emit(GetSeachedCruiseresultsState.getuserFailure(
            error: 'An error occurred: $e'));
      }
    });
  }
}
