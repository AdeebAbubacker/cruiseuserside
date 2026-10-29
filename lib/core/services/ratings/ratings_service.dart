import 'dart:async';
import 'dart:convert';
import 'package:cruise_buddy/core/constants/functions/connection/connectivity_checker.dart';
import 'package:cruise_buddy/core/db/shared/shared_prefernce.dart';
import 'package:cruise_buddy/core/env/env.dart';
import 'package:cruise_buddy/core/model/ratings_response_model/ratings_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class RatingService {
  final ConnectivityChecker _connectivityChecker = ConnectivityChecker();
  final String url = BaseUrl.prod;

  Future<Either<String, RatingsResponseModel>> submitRating({
    required String cruiseId,
    required String rating,
    String? description,
  }) async {
    try {
      // ✅ Check internet
      final hasInternet = await _connectivityChecker.hasInternetAccess();
      if (!hasInternet) {
        print("No internet connection");
        return const Left('No internet connection');
      }

      // ✅ Get token
      final token = await GetSharedPreferences.getAccessToken();
      if (token == null || token.isEmpty) {
        print('No access token found.');
        return const Left('No access token found.');
      }

      // ✅ Headers
      final headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'CRUISE_AUTH_KEY': '29B37-89DFC5E37A525891-FE788E23',
      };

      // ✅ API Endpoint
      final uri = Uri.parse('$url/rating');

      // ✅ Multipart request
      final request = http.MultipartRequest('POST', uri)
        ..headers.addAll(headers)
        ..fields['cruiseId'] = cruiseId
        ..fields['rating'] = rating;

      if (description != null && description.isNotEmpty) {
        request.fields['description'] = description;
      }

      // ✅ Send request
      final streamedResponse = await request.send().timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException('The request timed out.');
        },
      );

      final response = await http.Response.fromStream(streamedResponse);
      print('Response body: ${response.body}');

      // ✅ Handle response
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);

        final ratingResponse = RatingsResponseModel.fromJson(data);
        print('✅ Rating submitted successfully');

        return Right(ratingResponse);
      } else {
        print('❌ Failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
        return Left('Failed to submit rating: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
      return Left('Error: $e');
    }
  }
}
