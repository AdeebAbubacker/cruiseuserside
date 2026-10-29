part of 'post_ratings_bloc.dart';

@freezed
class PostRatingsState with _$PostRatingsState {
  const factory PostRatingsState.initial() = _Initial;
  const factory PostRatingsState.loading() = _Loading;
  const factory PostRatingsState.registrationSuccess(
      {required RatingsResponseModel ratingResponse}) = _RatingsSuccess;
  const factory PostRatingsState.registrationFailure({required String error}) =
      LoginFailure;
  const factory PostRatingsState.noInternet() = _NoInternet;
}
