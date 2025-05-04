import 'dart:async';
import 'dart:convert';
import 'package:cruise_buddy/core/constants/functions/connection/connectivity_checker.dart';
import 'package:cruise_buddy/core/db/shared/shared_prefernce.dart';
import 'package:cruise_buddy/core/model/booking_response_model/booking_response_model.dart';
import 'package:cruise_buddy/core/model/featured_boats_model/featured_boats_model.dart';
import 'package:cruise_buddy/core/model/my_bookings_model/my_bookings_model.dart';

import 'package:cruise_buddy/core/model/posted_favouritem_item_model/posted_favouritem_item_model.dart';
import 'package:cruise_buddy/core/model/viewmy_package_model/viewmy_package_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class ViewPackageService {
  final ConnectivityChecker _connectivityChecker = ConnectivityChecker();

  final String url = 'https://cruisebuddy.in/api/v1';

  final Map<String, String> _headers = {
    'Accept': 'application/json',
    'CRUISE_AUTH_KEY': '29B37-89DFC5E37A525891-FE788E23',
  };

  Future<Either<String, ViewmyPackageModel>> viewMyPackages({
    String? pacakgeId,
  }) async {
    try {
      // Check for internet connectivity
      final hasInternet = await _connectivityChecker.hasInternetAccess();
      if (!hasInternet) {
        print("No internet connection");
        return const Left('No internet connection');
      }

      // Get access token
      final token = await GetSharedPreferences.getAccessToken();

      if (token == null) {
        print('No access token found.');
        return const Left('No access token found.');
      }

      // Add the Authorization header dynamically
      _headers['Authorization'] = 'Bearer $token';

      // Build URL with query parameters as per the 'curl' example
      final uri = Uri.parse(
        '$url/package/$pacakgeId?include=cruise.cruiseType,cruise.ratings,cruise.cruisesImages,cruise.location,itineraries,amenities,food,packageImages,bookingTypes',
      );

      // Send GET request
      final response = await http.get(uri, headers: _headers).timeout(
        Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException('The request timed out.');
        },
      );

      // Handle response
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);
        final locationDetails = ViewmyPackageModel.fromJson(data);
        print(locationDetails.data);
        return Right(locationDetails);
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
        return Left('Failed to fetch location details: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
      return Left('Error: $e');
    }
  }
}
