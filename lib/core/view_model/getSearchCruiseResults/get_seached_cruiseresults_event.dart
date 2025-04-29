part of 'get_seached_cruiseresults_bloc.dart';

@freezed
class GetSeachedCruiseresultsEvent with _$GetSeachedCruiseresultsEvent {
  const factory GetSeachedCruiseresultsEvent.started() = _Started;
  const factory GetSeachedCruiseresultsEvent.SeachedCruise({
    required String filterCriteria,
    required String location,
    required String minAmount,
    required String maxAmount,
  }) = _GetSeachedCruiseresultsEvent;
}
