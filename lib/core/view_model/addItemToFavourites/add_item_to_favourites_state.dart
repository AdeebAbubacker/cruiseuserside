part of 'add_item_to_favourites_bloc.dart';

@freezed
class AddItemToFavouritesState with _$AddItemToFavouritesState {
  const factory AddItemToFavouritesState.initial() = _Initial;
  const factory AddItemToFavouritesState.loading() = _Loading;
  const factory AddItemToFavouritesState.addedSuccess(
          {required PostedFavouritemItemModel postedfavouritemitemodel}) =
      _PostedFavouritemItemSuccess;
  const factory AddItemToFavouritesState.addedFailure({required String error}) =
      AddItemToFavouritesFailure;
  const factory AddItemToFavouritesState.noInternet() = _NoInternet;
}
