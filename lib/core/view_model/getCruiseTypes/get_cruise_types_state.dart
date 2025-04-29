part of 'get_cruise_types_bloc.dart';

@freezed
class GetCruiseTypesState with _$GetCruiseTypesState {
  const factory GetCruiseTypesState.initial() = _Initial;
  const factory GetCruiseTypesState.loading() = _Loading;
  const factory GetCruiseTypesState.getCruiseTypes(
      {required CruiseTypeModel cruisetypemodel}) = _GetcruiseTypes;

  const factory GetCruiseTypesState.getCruiseTypesFailure(
      {required String error}) = GetCruiseTypesFailure;
  const factory GetCruiseTypesState.noInternet() = _NoInternet;
}
