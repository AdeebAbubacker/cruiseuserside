import 'dart:async';
import 'dart:convert';
import 'package:cruise_buddy/core/constants/functions/connection/connectivity_checker.dart';
import 'package:cruise_buddy/core/db/shared/shared_prefernce.dart';
import 'package:cruise_buddy/core/env/env.dart';
import 'package:cruise_buddy/core/model/booking_response_model/booking_response_model.dart';
import 'package:cruise_buddy/core/model/my_bookings_model/my_bookings_model.dart';

import 'package:cruise_buddy/core/model/posted_favouritem_item_model/posted_favouritem_item_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class BookingService {
  final ConnectivityChecker _connectivityChecker = ConnectivityChecker();

  final String url = BaseUrl.prod;

  final Map<String, String> _headers = {
    'Accept': 'application/json',
    'CRUISE_AUTH_KEY': '29B37-89DFC5E37A525891-FE788E23',
  };

  Future<Either<String, BookingResponseModel>> addItemToBookeditem({
    required String packageId,
    required String bookingTypeId,
    String? vegCount,
    String? nonVegCount,
    String? jainVegCount,
    String? customerNote,
    required String startDate,
    String? endDate,
    String? totalAmount,
  }) async {
    try {
      final hasInternet = await _connectivityChecker.hasInternetAccess();

      if (!hasInternet) {
        print("No internet");
        return const Left('No internet');
      }

      final token = await GetSharedPreferences.getAccessToken();
      //if (token == null) {
      //       print('No access token found.');
      //       return const Left('No access token found.');
      //    }

      // Add headers
      final Map<String, String> headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'CRUISE_AUTH_KEY': '29B37-89DFC5E37A525891-FE788E23',
      };

      // Build URL
      final uri = Uri.parse('$url/booking');

      // Create request body
      final body = {
        'packageId': packageId,
        'bookingTypeId': bookingTypeId,
        'startDate': startDate,
        if (vegCount != null) 'vegCount': vegCount,
        if (nonVegCount != null) 'nonVegCount': nonVegCount,
        if (jainVegCount != null) 'jainVegCount': jainVegCount,
        if (customerNote != null) 'customerNote': customerNote,
        if (endDate != null) 'endDate': endDate,
        if (totalAmount != null) 'totalAmount': totalAmount,
      };
      print('my body ${body}');
      // Make POST request
      final response = await http
          .post(
        uri,
        headers: headers,
        body: body,
      )
          .timeout(
        Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException('The request timed out.');
        },
      );
      print('Response body: ${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Response body: ${response.body}');
        final data = json.decode(response.body);
        final bookingDetails = BookingResponseModel.fromJson(data);
        print('Response Data: $data');
        return Right(bookingDetails);
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
        return Left('Failed to fetch booking details: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
      return Left('Error: $e');
    }
  }

  Future<Either<String, MyBookingsModel>> getMyBookings(
      {String? locationName}) async {
    try {
      final hasInternet = await _connectivityChecker.hasInternetAccess();
      if (!hasInternet) {
        print("No internet connection");
        return const Left('No internet connection');
      }

      final token = await GetSharedPreferences.getAccessToken();

      //if (token == null) {
      //       print('No access token found.');
      //       return const Left('No access token found.');
      //    }

      // Add headers
      _headers['Authorization'] = 'Bearer $token';
      _headers['CRUISE_AUTH_KEY'] =
          '16|OJfQtxaw6r4MBeEQ4JLzIT1m4UClhdUhvK3zNVJ7e01d3d19';

      // Build URL with query parameter
      final uri = Uri.parse(
          '$url/booking?include=package.cruise.owner,package.cruise.cruisesImages');

      final response = await http.get(uri, headers: _headers).timeout(
        Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException('The request timed out.');
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);
        final locationDetails = MyBookingsModel.fromJson(data);
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
}
