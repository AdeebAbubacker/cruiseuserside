part of 'update_user_profile_bloc.dart';

@freezed
class UpdateUserProfileState with _$UpdateUserProfileState {
  const factory UpdateUserProfileState.initial() = _Initial;
    const factory UpdateUserProfileState.loading() = _Loading;
  const factory UpdateUserProfileState.updateuser(
      {required UserUpdateSuccesModel updateuser}) = _Updateuser;
  const factory UpdateUserProfileState.updateFailure(
      {required String error}) = _RemoveItemFailure;
  const factory UpdateUserProfileState.noInternet() = _NoInternet;
}
