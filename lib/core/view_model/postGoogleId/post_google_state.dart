part of 'post_google_bloc.dart';

@freezed
class PostGoogleState with _$PostGoogleState {
  const factory PostGoogleState.initial() = _Initial;
  const factory PostGoogleState.loading() = _Loading;
  const factory PostGoogleState.addedSuccess(
          {required VerifiedgoogleIdModel gmailresponse}) =
      _PostedFavouritemItemSuccess;
  const factory PostGoogleState.addedFailure({required String error}) =
      AddItemToFavouritesFailure;
  const factory PostGoogleState.noInternet() = _NoInternet;
}
