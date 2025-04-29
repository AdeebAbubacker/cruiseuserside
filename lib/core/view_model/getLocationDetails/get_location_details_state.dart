part of 'get_location_details_bloc.dart';

@freezed
class GetLocationDetailsState with _$GetLocationDetailsState {
  const factory GetLocationDetailsState.initial() = _Initial;
  const factory GetLocationDetailsState.loading() = _Loading;
  const factory GetLocationDetailsState.getLocationDetails(
      {required LocationModel locationmodel}) = _GetLocationDetails;

  const factory GetLocationDetailsState.getlocationsFailure(
      {required String error}) = GetlocationsFailure;
  const factory GetLocationDetailsState.noInternet() = _NoInternet;
}
