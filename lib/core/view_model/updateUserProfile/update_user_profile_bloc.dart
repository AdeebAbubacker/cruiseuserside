import 'package:bloc/bloc.dart';
import 'package:cruise_buddy/core/model/user_update_succes_model/user_update_succes_model.dart';
import 'package:cruise_buddy/core/services/user/user_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_user_profile_event.dart';
part 'update_user_profile_state.dart';
part 'update_user_profile_bloc.freezed.dart';

class UpdateUserProfileBloc
    extends Bloc<UpdateUserProfileEvent, UpdateUserProfileState> {
  UpdateUserProfileBloc() : super(_Initial()) {
    UserService userService = UserService();
    on<_RemoveItemFavourites>((event, emit) async {
      emit(const UpdateUserProfileState.loading());

      try {
        final result = await userService.updateUserProfile();

        await result.fold((failure) async {
          if (failure == "No internet") {
            emit(const UpdateUserProfileState.noInternet());
          } else {
            emit(UpdateUserProfileState.updateFailure(error: failure));
          }
        }, (success) async {
          print('success');
          emit(
            UpdateUserProfileState.updateuser(
              updateuser: success,
            ),
          );
        });
      } catch (e) {
        emit(UpdateUserProfileState.updateFailure(
            error: 'An error occurred: $e'));
      }
    });
  }
}
