import 'package:bloc/bloc.dart';
import 'package:cruise_buddy/core/model/user_profile_model/user_profile_model.dart';
import 'package:cruise_buddy/core/services/user/user_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_user_profile_event.dart';
part 'get_user_profile_state.dart';
part 'get_user_profile_bloc.freezed.dart';

class GetUserProfileBloc
    extends Bloc<GetUserProfileEvent, GetUserProfileState> {
  GetUserProfileBloc() : super(_Initial()) {
    UserService userService = UserService();
    on<_GetUserProfile>((event, emit) async {
      emit(const GetUserProfileState.loading());

      try {
        final result = await userService.getUserProfile();

        await result.fold((failure) async {
          if (failure == "No internet") {
            emit(const GetUserProfileState.noInternet());
          } else {
            emit(GetUserProfileState.getuserFailure(error: failure));
          }
        }, (success) async {
          emit(GetUserProfileState.getuseruccess(userprofilemodel: success));
        });
      } catch (e) {
        emit(
            GetUserProfileState.getuserFailure(error: 'An error occurred: $e'));
      }
    });
  }
}
