part of 'get_cruise_types_bloc.dart';

@freezed
class GetCruiseTypesEvent with _$GetCruiseTypesEvent {
  const factory GetCruiseTypesEvent.started() = _Started;
  const factory GetCruiseTypesEvent.getCruiseTypes() = _GetCruiseTypes;
}
