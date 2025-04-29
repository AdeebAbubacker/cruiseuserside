part of 'get_favourites_list_bloc.dart';

@freezed
class GetFavouritesListState with _$GetFavouritesListState {
  const factory GetFavouritesListState.initial() = _Initial;
  const factory GetFavouritesListState.loading() = _Loading;
  const factory GetFavouritesListState.getfavouritesBoats(
      {required FavouritesListModel favourites}) = _GetfavouritesBoats;

  const factory GetFavouritesListState.getfavouritesFailure(
      {required String error}) = GetfavouritesFailure;
  const factory GetFavouritesListState.noInternet() = _NoInternet;
}
