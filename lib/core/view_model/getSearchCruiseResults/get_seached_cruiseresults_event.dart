part of 'get_seached_cruiseresults_bloc.dart';

@freezed
class GetSeachedCruiseresultsEvent with _$GetSeachedCruiseresultsEvent {
  const factory GetSeachedCruiseresultsEvent.started() = _Started;
  const factory GetSeachedCruiseresultsEvent.SeachedCruise({
    String? location,
    String? amenities,
    String? startDate,
    String? endDate,
    String? fullDayorDayCruise,
    String? premiumOrDeluxe,
    String? minAmount,
    String? maxAmount,
    String? closedOrOpened,
    String? noOfRooms,
    String? noOfPassengers,
  }) = _GetSeachedCruiseresultsEvent;
}
