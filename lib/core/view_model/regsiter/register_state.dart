part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loading() = _Loading;
  const factory RegisterState.registrationSuccess(
      {required RegistrationModel registerModel}) = _RegistrationSuccess;
  const factory RegisterState.registrationFailure({required String error}) =
      LoginFailure;
  const factory RegisterState.noInternet() = _NoInternet;
}
