part of 'view_my_package_bloc.dart';

@freezed
class ViewMyPackageState with _$ViewMyPackageState {
  const factory ViewMyPackageState.initial() = _Initial;
  const factory ViewMyPackageState.loading() = _Loading;
  const factory ViewMyPackageState.viewMyPacakge(
      {required ViewmyPackageModel mybookingmodel}) = _ViewMyPacakge;

  const factory ViewMyPackageState.getuserFailure({required String error}) =
      GetuserFailure;
  const factory ViewMyPackageState.noInternet() = _NoInternet;
}
