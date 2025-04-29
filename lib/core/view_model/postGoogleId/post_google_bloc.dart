import 'package:cruise_buddy/core/db/shared/shared_prefernce.dart';

import 'package:cruise_buddy/core/model/verifiedgoogle_id_model/verifiedgoogle_id_model.dart';
import 'package:cruise_buddy/core/services/auth/auth_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'post_google_event.dart';
part 'post_google_state.dart';
part 'post_google_bloc.freezed.dart';

class PostGoogleBloc extends Bloc<PostGoogleEvent, PostGoogleState> {
  PostGoogleBloc() : super(_Initial()) {
    AuthServices authServices = AuthServices();
    on<_PostGoogle>((event, emit) async {
      emit(const PostGoogleState.loading());

      try {
        final result = await authServices.googleVerifyUid(
            idToken: event.UId, name: event.name);

        await result.fold((failure) async {
          if (failure == "No internet") {
            emit(const PostGoogleState.noInternet());
          } else {
            emit(PostGoogleState.addedFailure(error: failure));
          }
        }, (success) async {
          await SetSharedPreferences.storeAccessToken(
            accessToken: success.token.toString(),
          );
          emit(
            PostGoogleState.addedSuccess(
              gmailresponse: success,
            ),
          );
        });
      } catch (e) {
        emit(PostGoogleState.addedFailure(error: 'An error occurred: $e'));
      }
    });
  }
}
