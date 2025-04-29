part of 'book_my_cruise_bloc.dart';

@freezed
class BookMyCruiseEvent with _$BookMyCruiseEvent {
  const factory BookMyCruiseEvent.started() = _Started;
  const factory BookMyCruiseEvent.createNewbookings({
    required String date,
    required String packageId,
  }) = _BookMyCruiseEventboats;
}
