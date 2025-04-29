part of 'list_cruiseon_location_bloc.dart';

@freezed
class ListCruiseonLocationEvent with _$ListCruiseonLocationEvent {
  const factory ListCruiseonLocationEvent.started() = _Started;
  const factory ListCruiseonLocationEvent.getCruise(
      {required String location}) = _GetCruise;
}
