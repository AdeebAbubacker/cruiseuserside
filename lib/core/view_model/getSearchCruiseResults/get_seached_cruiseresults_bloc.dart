import 'dart:math';

import 'package:bloc/bloc.dart';

import 'package:cruise_buddy/core/model/featured_boats_model/featured_boats_model.dart';
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
          amenities: event.amenities,
          location: event.location,
          startDate: event.startDate,
          endDate: event.endDate,
          closedOrOpened: event.closedOrOpened,
          fullDayorDayCruise: event.fullDayorDayCruise,
          maxAmount: event.maxAmount,
          minAmount: event.minAmount,
          noOfPassengers: event.noOfPassengers,
          noOfRooms: event.noOfRooms,
          premiumOrDeluxe: event.premiumOrDeluxe,
        );

        await result.fold((failure) async {
          if (failure == "No internet") {
            print('No interne');
            emit(const GetSeachedCruiseresultsState.noInternet());
          } else {
            print('No getuserFailure');
            emit(GetSeachedCruiseresultsState.getuserFailure(error: failure));
          }
        }, (success) async {
          print('success');
          emit(GetSeachedCruiseresultsState.getuseruccess(
              packagesearchresults: success));
        });
      } catch (e) {
        print('e');
        print('catch');
        emit(GetSeachedCruiseresultsState.getuserFailure(
            error: 'An error occurred: $e'));
      }
    });
  }
}
