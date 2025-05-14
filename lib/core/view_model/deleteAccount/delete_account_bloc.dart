import 'package:bloc/bloc.dart';
import 'package:cruise_buddy/core/model/delete_account_model/delete_account_model.dart';
import 'package:cruise_buddy/core/services/auth/auth_services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_account_event.dart';
part 'delete_account_state.dart';
part 'delete_account_bloc.freezed.dart';

class DeleteAccountBloc extends Bloc<DeleteAccountEvent, DeleteAccountState> {
  DeleteAccountBloc() : super(_Initial()) {
    AuthServices authServices = AuthServices();
    on<_DeleteAccount>((event, emit) async {
      emit(const DeleteAccountState.loading());

      try {
        final result = await authServices.deleteccount();

        await result.fold((failure) async {
          if (failure == "No internet") {
            emit(const DeleteAccountState.noInternet());
          } else {
            emit(DeleteAccountState.getuserFailure(error: failure));
          }
        }, (success) async {
          emit(
              DeleteAccountState.getuseruccess(deleteAccountResponse: success));
        });
      } catch (e) {
        emit(DeleteAccountState.getuserFailure(error: 'An error occurred: $e'));
      }
    });
  }
}
