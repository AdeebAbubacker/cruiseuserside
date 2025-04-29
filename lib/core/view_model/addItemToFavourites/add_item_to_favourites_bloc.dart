import 'package:bloc/bloc.dart';
import 'package:cruise_buddy/core/model/posted_favouritem_item_model/posted_favouritem_item_model.dart';
import 'package:cruise_buddy/core/services/favourites/favourites_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_item_to_favourites_event.dart';
part 'add_item_to_favourites_state.dart';
part 'add_item_to_favourites_bloc.freezed.dart';

class AddItemToFavouritesBloc
    extends Bloc<AddItemToFavouritesEvent, AddItemToFavouritesState> {
  AddItemToFavouritesBloc() : super(_Initial()) {
    FavouritesService favouritesService = FavouritesService();
    on<_AddItemToFavourites>((event, emit) async {
      emit(const AddItemToFavouritesState.loading());

      try {
        final result = await favouritesService.addItemToFavourites(
          packageId: event.packageId,
        );

        await result.fold((failure) async {
          if (failure == "No internet") {
            emit(const AddItemToFavouritesState.noInternet());
          } else {
            emit(AddItemToFavouritesState.addedFailure(error: failure));
          }
        }, (success) async {
          print('success');
          emit(
            AddItemToFavouritesState.addedSuccess(
              postedfavouritemitemodel: success,
            ),
          );
        });
      } catch (e) {
        emit(AddItemToFavouritesState.addedFailure(
            error: 'An error occurred: $e'));
      }
    });
  }
}
