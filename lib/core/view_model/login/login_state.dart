part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.loginSuccess({required LoginModel loginModel}) =
      _LoginSuccess;

  const factory LoginState.loginFailure({required String error}) = LoginFailure;
  const factory LoginState.noInternet() = _NoInternet;
}
