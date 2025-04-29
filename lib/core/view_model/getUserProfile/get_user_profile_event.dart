part of 'get_user_profile_bloc.dart';

@freezed
class GetUserProfileEvent with _$GetUserProfileEvent {
  const factory GetUserProfileEvent.started() = _Started;
  const factory GetUserProfileEvent.getUserProfile() = _GetUserProfile;
}
