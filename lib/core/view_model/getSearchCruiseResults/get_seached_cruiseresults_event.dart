part of 'get_seached_cruiseresults_bloc.dart';

@freezed
class GetSeachedCruiseresultsEvent with _$GetSeachedCruiseresultsEvent {
  const factory GetSeachedCruiseresultsEvent.started() = _Started;
  const factory GetSeachedCruiseresultsEvent.SeachedCruise({
    String? filterCriteria,
    String? location,
    String? minAmount,
    String? maxAmount,
    String? startDate,
    String? endDate,
    String? typeOfCruise,
    String? noOfPassengers,
    String? noOfRooms,
    String? premiumOrDeluxe,
    String? amenities,
  }) = _GetSeachedCruiseresultsEvent;
}

// final String? filterCriteria;
// final String? location;
// final String? startDate;
// final String? endDate;
// final String? maxAmount;
// final String? minAMount;
// final String? typeOfCruise;
// final String? noOfPassengers;
// final String? noOfRooms;
// final String? premiumOrDeluxe;
