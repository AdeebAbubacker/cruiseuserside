part of 'get_seached_cruiseresults_bloc.dart';

@freezed
class GetSeachedCruiseresultsEvent with _$GetSeachedCruiseresultsEvent {
  const factory GetSeachedCruiseresultsEvent.started() = _Started;
  const factory GetSeachedCruiseresultsEvent.SeachedCruise({
    String? foodTitle, // filter[food.title]
    bool? isVeg, // filter[food.is_veg]
    String? amenitiesName, // filter[amenities.name]
    String? cruiseModelName, // filter[cruiseType.model_name]
    String? cruiseType, // filter[cruiseType.type]
    String? minPrice, // filter[priceRange][min]
    String? maxPrice, // filter[priceRange][max]
    String? locationName, // filter[cruise.location.name]
  }) = _GetSeachedCruiseresultsEvent;
}
