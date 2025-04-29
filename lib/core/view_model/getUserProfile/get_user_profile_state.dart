part of 'get_user_profile_bloc.dart';

@freezed
class GetUserProfileState with _$GetUserProfileState {
  const factory GetUserProfileState.initial() = _Initial;
  const factory GetUserProfileState.loading() = _Loading;
  const factory GetUserProfileState.getuseruccess(
      {required UserProfileModel userprofilemodel}) = _Getuseruccess;

  const factory GetUserProfileState.getuserFailure({required String error}) =
      GetuserFailure;
  const factory GetUserProfileState.noInternet() = _NoInternet;
}
