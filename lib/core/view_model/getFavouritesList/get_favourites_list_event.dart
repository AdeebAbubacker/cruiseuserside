part of 'get_favourites_list_bloc.dart';

@freezed
class GetFavouritesListEvent with _$GetFavouritesListEvent {
  const factory GetFavouritesListEvent.started() = _Started;
  const factory GetFavouritesListEvent.getFavouriteboats() = _GetFavouriteboats;
}
