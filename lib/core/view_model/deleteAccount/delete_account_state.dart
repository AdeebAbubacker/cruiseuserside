part of 'delete_account_bloc.dart';

@freezed
class DeleteAccountState with _$DeleteAccountState {
  const factory DeleteAccountState.initial() = _Initial;
  const factory DeleteAccountState.loading() = _Loading;
  const factory DeleteAccountState.getuseruccess(
          {required DeleteAccountResponse deleteAccountResponse}) =
      _DeleteAccountsuccess;

  const factory DeleteAccountState.getuserFailure({required String error}) =
      GetuserFailure;
  const factory DeleteAccountState.noInternet() = _NoInternet;
}
