import 'dart:convert';
import 'package:cruise_buddy/core/constants/functions/connection/connectivity_checker.dart';
import 'package:cruise_buddy/core/db/shared/shared_prefernce.dart';
import 'package:cruise_buddy/core/model/categories_results_model/categories_results_model.dart';
import 'package:cruise_buddy/core/model/category_search_model/category_search_model.dart';
import 'package:cruise_buddy/core/model/cruise_type_model/cruise_type_model.dart';
import 'package:cruise_buddy/core/model/featured_boats_model/featured_boats_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class CruiseService {
  final ConnectivityChecker _connectivityChecker = ConnectivityChecker();

  final String url = 'https://cruisebuddy.in/api/v1';

  final Map<String, String> _headers = {
    'Accept': 'application/json',
    'CRUISE_AUTH_KEY': '29B37-89DFC5E37A525891-FE788E23',
    // Bearer token will be added dynamically to the headers
  };

  Future<Either<String, CruiseTypeModel>> getCruiseTypes() async {
    try {
      final hasInternet = await _connectivityChecker.hasInternetAccess();
      if (!hasInternet) {
        print("No internet");
        return const Left('No internet');
      }

      // Retrieve the Bearer token from shared preferences
      final token = await GetSharedPreferences.getAccessToken();

      if (token == null) {
        print('No access token found.');
        return const Left('No access token found.');
      }

      // Add the Authorization Bearer token to the headers dynamically
      _headers['Authorization'] = 'Bearer $token';

      final response = await http.get(
        Uri.parse('$url/cruise-type'),
        headers: _headers,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);

        final cruisetypes = CruiseTypeModel.fromJson(data);
        print(data);
        return Right(cruisetypes);
      } else {
        print('Request failed: ${response.body.toLowerCase()}');
        return Left('Failed to get cruise type: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
      return Left('Error: $e'); // Handling other errors
    }
  }

  Future<Either<String, FeaturedBoatsModel>> getFeaturedBoats() async {
    try {
      final hasInternet = await _connectivityChecker.hasInternetAccess();
      if (!hasInternet) {
        print("No internet");
        return const Left('No internet');
      }

      final token = await GetSharedPreferences.getAccessToken();

      if (token == null) {
        print('No access token found.');
        return const Left('No access token found.');
      }

      _headers['Authorization'] = 'Bearer $token';

      final response = await http.get(
        Uri.parse(
            '$url/featured/package?include=cruise.cruiseType,cruise.ratings,cruise.cruisesImages,cruise.location,itineraries,amenities,food,packageImages,bookingTypes,unavailableDates'),
        headers: _headers,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);

        final locationdetails = FeaturedBoatsModel.fromJson(data);

        return Right(locationdetails);
      } else {
        print('Request failed: ${response.body.toLowerCase()}');
        return Left('Failed to get cruise type: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }

  Future<Either<String, CategorySearchModel>> getSearchResultsList({
    String? location,
    String? amenities,
    String? startDate,
    String? endDate,
    String? bookingType, // e.g., full_day_cruise
    String? premiumOrDeluxe, // e.g., premium or delux
    String? minAmount,
    String? maxAmount,
    String? cruiseModelName, // e.g., full_upper_deck
    String? cruiseType, // e.g., open or closed
  }) async {
    try {
      final hasInternet = await _connectivityChecker.hasInternetAccess();
      if (!hasInternet) return const Left('No internet');

      final token = await GetSharedPreferences.getAccessToken();
      if (token == null) return const Left('No access token found.');

      _headers['Authorization'] = 'Bearer $token';

      String urlString =
          '$url/package?include=cruise.cruiseType,cruise.ratings,cruise.cruisesImages,cruise.location,itineraries,amenities,food,packageImages,bookingTypes,unavailableDates';

      if (location?.isNotEmpty == true) {
        urlString += '&filter[cruise.location.name]=$location';
      }

      if (startDate?.isNotEmpty == true) {
        urlString += '&filter[dateRange][start]=$startDate';
      }

      if (endDate?.isNotEmpty == true) {
        urlString += '&filter[dateRange][end]=$endDate';
      }

      if (bookingType?.isNotEmpty == true) {
        urlString += '&filter[bookingTypes.name]=$bookingType';
      }

      if (premiumOrDeluxe?.isNotEmpty == true) {
        urlString += '&filter[name]=$premiumOrDeluxe';
      }

      if (minAmount?.isNotEmpty == true) {
        urlString += '&filter[priceRange][min]=$minAmount';
      }

      if (maxAmount?.isNotEmpty == true) {
        urlString += '&filter[priceRange][max]=$maxAmount';
      }

      if (amenities?.isNotEmpty == true) {
        urlString += '&filter[amenities.name]=$amenities';
      }

      if (cruiseModelName?.isNotEmpty == true) {
        urlString += '&filter[cruiseType.model_name]=$cruiseModelName';
      }

      if (cruiseType?.isNotEmpty == true) {
        urlString += '&filter[cruiseType.type]=$cruiseType';
      }

      final response = await http.get(
        Uri.parse(urlString),
        headers: _headers,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);
        final locationdetails = CategorySearchModel.fromJson(data);
        return Right(locationdetails);
      } else {
        return Left('Failed to get cruise type: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }

  Future<Either<String, FeaturedBoatsModel>> getAllCruise() async {
    try {
      final hasInternet = await _connectivityChecker.hasInternetAccess();
      if (!hasInternet) {
        print("No internet");
        return const Left('No internet');
      }

      final token = await GetSharedPreferences.getAccessToken();

      if (token == null) {
        print('No access token found.');
        return const Left('No access token found.');
      }

      _headers['Authorization'] = 'Bearer $token';

      final response = await http.get(
        Uri.parse(
            '$url/featured/cruise?include=cruisesImages,packages.packageImages'),
        headers: _headers,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);

        final locationdetails = FeaturedBoatsModel.fromJson(data);

        return Right(locationdetails);
      } else {
        print('Request failed: ${response.body.toLowerCase()}');
        return Left('Failed to get cruise type: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }
}
