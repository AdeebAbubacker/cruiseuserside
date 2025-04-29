part of 'add_item_to_favourites_bloc.dart';

@freezed
class AddItemToFavouritesEvent with _$AddItemToFavouritesEvent {
  const factory AddItemToFavouritesEvent.started() = _Started;
  const factory AddItemToFavouritesEvent.added({
    required String packageId,
  }) = _AddItemToFavourites;
}
