part of 'list_cruiseon_location_bloc.dart';

@freezed
class ListCruiseonLocationState with _$ListCruiseonLocationState {
  const factory ListCruiseonLocationState.initial() = _Initial;
  const factory ListCruiseonLocationState.loading() = _Loading;
  const factory ListCruiseonLocationState.getcruiseuccess(
      {required CruiseModel cruisemodel}) = _Getcruiseuccess;

  const factory ListCruiseonLocationState.getcruiseFailure(
      {required String error}) = GetcruiseFailure;
  const factory ListCruiseonLocationState.noInternet() = _NoInternet;
}
