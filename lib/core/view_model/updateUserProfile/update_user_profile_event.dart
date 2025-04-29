part of 'update_user_profile_bloc.dart';

@freezed
class UpdateUserProfileEvent with _$UpdateUserProfileEvent {
  const factory UpdateUserProfileEvent.started() = _Started;
  const factory UpdateUserProfileEvent.updateprofile({
    String? name,
    String? email,
    String? phone,
    String? image,
  }) = _RemoveItemFavourites;
}
