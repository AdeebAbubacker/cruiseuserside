import 'dart:async';
import 'dart:convert';
import 'package:cruise_buddy/core/constants/functions/connection/connectivity_checker.dart';
import 'package:cruise_buddy/core/db/shared/shared_prefernce.dart';
import 'package:cruise_buddy/core/model/favourites_list_model/favourites_list_model.dart';
import 'package:cruise_buddy/core/model/posted_favouritem_item_model/posted_favouritem_item_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class FavouritesService {
  final ConnectivityChecker _connectivityChecker = ConnectivityChecker();

  final String url = 'https://cruisebuddy.in/api/v1';

  final Map<String, String> _headers = {
    'Accept': 'application/json',
    'CRUISE_AUTH_KEY': '29B37-89DFC5E37A525891-FE788E23',
    // Bearer token will be added dynamically to the headers
  };

  Future<Either<String, FavouritesListModel>> getFavouriteDetails(
      {String? locationName}) async {
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

      // Add headers
      _headers['Authorization'] = 'Bearer $token';
      _headers['CRUISE_AUTH_KEY'] =
          '16|OJfQtxaw6r4MBeEQ4JLzIT1m4UClhdUhvK3zNVJ7e01d3d19';

      // Build URL with query parameter
      final uri = Uri.parse(
          '$url/favorite?include=user,package.cruise,package.cruise.cruiseType,package.cruise.ratings,package.itineraries,package.amenities,package.food,package.packageImages,package.bookingTypes');

      final response = await http.get(uri, headers: _headers).timeout(
        Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException('The request timed out.');
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);
        final locationDetails = FavouritesListModel.fromJson(data);
        print(locationDetails.data?.length);
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

  Future<Either<String, PostedFavouritemItemModel>> addItemToFavourites({
    required String packageId,
  }) async {
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

      // Add headers
      _headers['Authorization'] = 'Bearer $token';
      _headers['CRUISE_AUTH_KEY'] =
          '16|OJfQtxaw6r4MBeEQ4JLzIT1m4UClhdUhvK3zNVJ7e01d3d19';
      _headers['Accept'] = 'application/json';

      // Build URL
      final uri = Uri.parse('$url/favorite');

      // Create request body
      final body = {
        'packageId': packageId,
      };

      // Make POST request
      final response = await http
          .post(
        uri,
        headers: _headers,
        body: body,
      )
          .timeout(
        Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException('The request timed out.');
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);
        final locationDetails = PostedFavouritemItemModel.fromJson(data);
        print('${data}');
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

  Future<Either<String, String>> removeItemFromFavourites({
    required String favouritesId,
  }) async {
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

      // Add headers
      _headers['Authorization'] = 'Bearer $token';
      _headers['CRUISE_AUTH_KEY'] =
          '16|OJfQtxaw6r4MBeEQ4JLzIT1m4UClhdUhvK3zNVJ7e01d3d19';
      _headers['Accept'] = 'application/json';

      // Build URL (appending favouritesId)
      final uri = Uri.parse('$url/favorite/$favouritesId');

      // Make DELETE request
      final response = await http
          .delete(
        uri,
        headers: _headers,
      )
          .timeout(
        Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException('The request timed out.');
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Item removed successfully.');
        return Right('Item removed successfully');
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
        return Left('Failed to remove item: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
      return Left('Error: $e');
    }
  }
}
