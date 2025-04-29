part of 'get_featured_boats_bloc.dart';

@freezed
class GetFeaturedBoatsState with _$GetFeaturedBoatsState {
  const factory GetFeaturedBoatsState.initial() = _Initial;
  const factory GetFeaturedBoatsState.loading() = _Loading;
  const factory GetFeaturedBoatsState.getFeaturedBoats(
      {required FeaturedBoatsModel featuredBoats}) = _GetfeaturedBoats;

  const factory GetFeaturedBoatsState.getFeaturedBoatsFailure(
      {required String error}) = GetFeaturedBoatsFailure;
  const factory GetFeaturedBoatsState.noInternet() = _NoInternet;
}
