part of 'post_ratings_bloc.dart';

@freezed
class PostRatingsEvent with _$PostRatingsEvent {
  const factory PostRatingsEvent.started() = _Started;
  const factory PostRatingsEvent.postRatings({
    required String cruiseId,
    required String ratings,
    String? description,
  }) = _RegisterRequested;
}
