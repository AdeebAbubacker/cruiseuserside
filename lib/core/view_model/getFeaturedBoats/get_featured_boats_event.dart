part of 'get_featured_boats_bloc.dart';

@freezed
class GetFeaturedBoatsEvent with _$GetFeaturedBoatsEvent {
  const factory GetFeaturedBoatsEvent.started() = _Started;
  const factory GetFeaturedBoatsEvent.getFeaturedBoats() = _GetFeaturedBoats;
}
