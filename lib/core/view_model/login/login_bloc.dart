import 'package:bloc/bloc.dart';
import 'package:cruise_buddy/core/model/login_model/login_model.dart';
import 'package:cruise_buddy/core/model/validation/login_validation/login_validation.dart';
import 'package:cruise_buddy/core/services/auth/auth_services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cruise_buddy/core/db/shared/shared_prefernce.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(_Initial()) {
    AuthServices apiServices = AuthServices();
    on<_LoginRequested>((event, emit) async {
      emit(const LoginState.loading());

      try {
        final result = await apiServices.login(
          email: event.email,
          password: event.password,
        );

        await result.fold((failure) async {
          if (failure == "No internet") {
            emit(const LoginState.noInternet());
          } else if (failure is LoginValidation) {
            print("login validation ${failure.message}");
            emit(LoginState.loginvaldationFailure(loginValidation: failure));
          } else {
            print("login validation ${failure.message}");
            emit(LoginState.loginFailure(error: failure.toString()));
          }
        }, (success) async {
          await SetSharedPreferences.storeAccessToken(
            accessToken: success.token.toString(),
          );
          emit(LoginState.loginSuccess(loginModel: success));
        });
      } catch (e) {
        emit(LoginState.loginFailure(error: 'An error occurred: $e'));
      }
    });
  }
}
