import 'dart:convert';
import 'package:cruise_buddy/core/constants/functions/connection/connectivity_checker.dart';
import 'package:cruise_buddy/core/db/shared/shared_prefernce.dart';
import 'package:cruise_buddy/core/model/cruise_model/cruise_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class PackagesService {
  final ConnectivityChecker _connectivityChecker = ConnectivityChecker();

  final String url = 'https://cruisebuddy.in/api/v1';

  final Map<String, String> _headers = {
    'Accept': 'application/json',
    'CRUISE_AUTH_KEY': '29B37-89DFC5E37A525891-FE788E23',
    // Bearer token will be added dynamically to the headers
  };

  Future<Either<String, CruiseModel>> getCruise(
      {required String location}) async {
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
            '$url/package?include=cruise.location&filter[cruise.location.name]=${location},cruise.cruisesImages,bookingTypes&filter[cruiseType.type]=closed'),
        headers: _headers,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);

        final locationdetails = CruiseModel.fromJson(data);
        print(data.toString());
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
