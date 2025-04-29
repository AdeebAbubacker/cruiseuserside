import 'package:bloc/bloc.dart';
import 'package:cruise_buddy/core/model/favourites_list_model/favourites_list_model.dart';
import 'package:cruise_buddy/core/services/favourites/favourites_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_favourites_list_event.dart';
part 'get_favourites_list_state.dart';
part 'get_favourites_list_bloc.freezed.dart';

class GetFavouritesListBloc
    extends Bloc<GetFavouritesListEvent, GetFavouritesListState> {
  GetFavouritesListBloc() : super(_Initial()) {
    FavouritesService favouritesService = FavouritesService();
    on<_GetFavouriteboats>((event, emit) async {
      emit(const GetFavouritesListState.loading());

      try {
        final result = await favouritesService.getFavouriteDetails();

        await result.fold((failure) async {
          if (failure == "No internet") {
            emit(const GetFavouritesListState.noInternet());
          } else {
            emit(GetFavouritesListState.getfavouritesFailure(error: failure));
          }
        }, (success) async {
          print('succees ${success.data?.length}');
          emit(
            GetFavouritesListState.getfavouritesBoats(
              favourites: success,
            ),
          );
        });
      } catch (e) {
        emit(GetFavouritesListState.getfavouritesFailure(
            error: 'An error occurred: $e'));
      }
    });
  
  
  }
}
