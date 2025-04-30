part of 'view_my_package_bloc.dart';

@freezed
class ViewMyPackageEvent with _$ViewMyPackageEvent {
  const factory ViewMyPackageEvent.started() = _Started;
  const factory ViewMyPackageEvent.viewMyPackage({
    required String packageId,
  }) = _ViewMyPackage;
}
