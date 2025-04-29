import 'package:bloc/bloc.dart';
import 'package:cruise_buddy/core/services/favourites/favourites_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'remove_item_favourites_event.dart';
part 'remove_item_favourites_state.dart';
part 'remove_item_favourites_bloc.freezed.dart';

class RemoveItemFavouritesBloc
    extends Bloc<RemoveItemFavouritesEvent, RemoveItemFavouritesState> {
  RemoveItemFavouritesBloc() : super(_Initial()) {
    FavouritesService favouritesService = FavouritesService();
    on<_RemoveItemFavourites>((event, emit) async {
      emit(const RemoveItemFavouritesState.loading());

      try {
        final result = await favouritesService.removeItemFromFavourites(
          favouritesId: event.favouritesId,
        );

        await result.fold((failure) async {
          if (failure == "No internet") {
            emit(const RemoveItemFavouritesState.noInternet());
          } else {
            emit(RemoveItemFavouritesState.addedFailure(error: failure));
          }
        }, (success) async {
          print('success');
          emit(
            RemoveItemFavouritesState.addedSuccess(
              postedfavouritemitemodel: "success",
            ),
          );
        });
      } catch (e) {
        emit(RemoveItemFavouritesState.addedFailure(
            error: 'An error occurred: $e'));
      }
    });
  }
}
