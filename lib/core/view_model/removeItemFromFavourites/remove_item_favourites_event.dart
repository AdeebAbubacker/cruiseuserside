part of 'remove_item_favourites_bloc.dart';

@freezed
class RemoveItemFavouritesEvent with _$RemoveItemFavouritesEvent {
  const factory RemoveItemFavouritesEvent.started() = _Started;
  const factory RemoveItemFavouritesEvent.added({
    required String favouritesId,
  }) = _RemoveItemFavourites;
}
