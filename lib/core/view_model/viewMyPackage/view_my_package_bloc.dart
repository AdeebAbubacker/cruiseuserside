import 'package:bloc/bloc.dart';
import 'package:cruise_buddy/core/model/favorites_list_model/favorites_list_model.dart';
import 'package:cruise_buddy/core/model/featured_boats_model/featured_boats_model.dart';
import 'package:cruise_buddy/core/model/viewmy_package_model/viewmy_package_model.dart';
import 'package:cruise_buddy/core/services/viewPacakge/view_package_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_my_package_event.dart';
part 'view_my_package_state.dart';
part 'view_my_package_bloc.freezed.dart';

class ViewMyPackageBloc extends Bloc<ViewMyPackageEvent, ViewMyPackageState> {
  ViewMyPackageBloc() : super(_Initial()) {
    ViewPackageService viewPackageService = ViewPackageService();
    on<_ViewMyPackage>((event, emit) async {
      emit(const ViewMyPackageState.loading());

      try {
        final result = await viewPackageService.viewMyPackages(
          pacakgeId: event.packageId,
        );

        await result.fold((failure) async {
          if (failure == "No internet") {
            print('---------------- "No internet"');
            emit(const ViewMyPackageState.noInternet());
          } else {
            print('---------------- ${failure}');
            emit(ViewMyPackageState.getuserFailure(error: failure));
          }
        }, (success) async {
          print('----------------success ${success}');
          print('----------------success ${success.data?.id.toString()}');
          print('----------------success ${success?.unavailableDate}');
          emit(ViewMyPackageState.viewMyPacakge(mybookingmodel: success));
        });
      } catch (e) {
        print('---------------- ${e}');
        emit(ViewMyPackageState.getuserFailure(error: 'An error occurred: $e'));
      }
    });
  }
}
