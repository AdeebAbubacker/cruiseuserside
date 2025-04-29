import 'dart:async';
import 'dart:convert';
import 'package:cruise_buddy/core/constants/functions/connection/connectivity_checker.dart';
import 'package:cruise_buddy/core/db/shared/shared_prefernce.dart';
import 'package:cruise_buddy/core/model/location_model/location_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class LocationService {
  final ConnectivityChecker _connectivityChecker = ConnectivityChecker();

  final String url = 'https://cruisebuddy.in/api/v1';

  final Map<String, String> _headers = {
    'Accept': 'application/json',
    'CRUISE_AUTH_KEY': '29B37-89DFC5E37A525891-FE788E23',
    // Bearer token will be added dynamically to the headers
  };

  Future<Either<String, LocationModel>> getLocationDetails({
    String? locationName,
    String? dateRangeStart,
    String? dateRangeEnd,
    String? include,
  }) async {
    try {
      final hasInternet = await _connectivityChecker.hasInternetAccess();
      if (!hasInternet) {
        print("No internet connection");
        return const Left('No internet connection');
      }

      final token = await GetSharedPreferences.getAccessToken();
      if (token == null) {
        print('No access token found.');
        return const Left('No access token found.');
      }

      _headers['Authorization'] = 'Bearer $token';
      _headers['CRUISE_AUTH_KEY'] = '29B37-89DFC5E37A525891-FE788E23';

      final queryParams = {
        if (locationName != null) 'filter[name]': locationName,
        if (dateRangeStart != null) 'filter[dateRange][start]': dateRangeStart,
        if (dateRangeEnd != null) 'filter[dateRange][end]': dateRangeEnd,
        if (include != null) 'include': include,
      };

      final uri =
          Uri.parse('$url/location').replace(queryParameters: queryParams);

      final response = await http.get(uri, headers: _headers).timeout(
        Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException('The request timed out.');
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);
        final locationDetails = LocationModel.fromJson(data);
        print(data);
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
