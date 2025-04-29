part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.started() = _Started;
  const factory RegisterEvent.loginRequested({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) = _RegisterRequested;
}
