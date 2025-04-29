part of 'post_google_bloc.dart';

@freezed
class PostGoogleEvent with _$PostGoogleEvent {
  const factory PostGoogleEvent.started() = _Started;
  const factory PostGoogleEvent.added({
    required String UId,
    required String name,
  }) = _PostGoogle;
}
