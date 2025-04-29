part of 'remove_item_favourites_bloc.dart';

@freezed
class RemoveItemFavouritesState with _$RemoveItemFavouritesState {
  const factory RemoveItemFavouritesState.initial() = _Initial;
  const factory RemoveItemFavouritesState.loading() = _Loading;
  const factory RemoveItemFavouritesState.addedSuccess(
      {required String postedfavouritemitemodel}) = _RemoveItemItemSuccess;
  const factory RemoveItemFavouritesState.addedFailure(
      {required String error}) = _RemoveItemFailure;
  const factory RemoveItemFavouritesState.noInternet() = _NoInternet;
}
