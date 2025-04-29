part of 'get_location_details_bloc.dart';

@freezed
class GetLocationDetailsEvent with _$GetLocationDetailsEvent {
  const factory GetLocationDetailsEvent.started() = _Started;
  const factory GetLocationDetailsEvent.getLocation({String? locationName}) =
      _GetLocation;
}
