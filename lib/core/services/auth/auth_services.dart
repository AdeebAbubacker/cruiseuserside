import 'dart:convert';
import 'package:cruise_buddy/core/constants/functions/connection/connectivity_checker.dart';
import 'package:cruise_buddy/core/db/shared/shared_prefernce.dart';
import 'package:cruise_buddy/core/model/login_model/login_model.dart';
import 'package:cruise_buddy/core/model/verifiedgoogle_id_model/verifiedgoogle_id_model.dart';
import 'package:cruise_buddy/core/model/registration_model/registration_model.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

class AuthServices {
  final ConnectivityChecker _connectivityChecker = ConnectivityChecker();

  final String url = 'https://cruisebuddy.in/api/v1';
  final Map<String, String> _headers = {
    'Accept': 'application/json',
    'CRUISE_AUTH_KEY': '29B37-89DFC5E37A525891-FE788E23',
    'Cookie':
        'XSRF-TOKEN=eyJpdiI6IktBbkpHQ051U2pnd1drYy90MVA1anc9PSIsInZhbHVlIjoieEFMbHVzMzMzSTluSnZCSnJYa0RXUXQ1UURqK1huY1RHdFZvZjFWR3NHWWphd0FQZ05iSmNqa0NDUTB4K1R4Q0RjclVVS1VRbStYMjRYdEEvSUgwS3VQWHNCaVJ5ZzFwelVpM2I4NnRvYWs5WDFYblV5TkpwQ3Q1bEo4b3I0U0EiLCJtYWMiOiI4ZWQ2OWQ4ODQwNTVlZTgzZmM5MDIwYjQ4NzY1MTk1NDdhMDdkMjIyMTZjNjA2MTRlYjAwZDJmNWQ0ZGRlZjYyIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IkUzRE5yWUhmaWtxeTV4b1hFZXVjdVE9PSIsInZhbHVlIjoiL0h0NjY4SndVSlU2WHdCZHlKQUNaUGFVTGZ4Q3U2UXZ3YUdjUmh2RmdkcVVUVm92QzFsUUFjUWdrNkNXNENEb0Z3d3NlbDVzQTFWSEUzMW5QbzdudjA4NWpMU0dNT0wzYWVyZmVndENST1I5NG5tTmlhUVFoNmhjZGxhaW5KcG8iLCJtYWMiOiJjYWY0ZTRlNjY2ZTFjYzVjYThmMjVmNTIwZDhlMDQxM2QzYWVlYWY5N2UxNzdhYzk3ODU3ZWI3MzQyNmNhYmRjIiwidGFnIjoiIn0%3D',
  };

  Future<Either<String, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final hasInternet = await _connectivityChecker.hasInternetAccess();
      if (!hasInternet) {
        print("No internet");
        return const Left('No internet');
      }
      final response = await http.post(
        Uri.parse('$url/login'),
        headers: _headers,
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = json.decode(response.body);

        final loginModel = LoginModel.fromJson(data);

        return Right(loginModel);
      } else {
        print('data failed ${response.body.toLowerCase()}');
        return Left('Failed to login: ${response.body}');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }

  Future<Either<String, RegistrationModel>> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final Uri uri = Uri.parse('$url/register');

    // Prepare the headers
    final headers = {
      'Accept': 'application/json',
      'CRUISE_AUTH_KEY': '29B37-89DFC5E37A525891-FE788E23',
    };

    // Prepare the form data
    final body = {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': confirmPassword,
    };

    try {
      final hasInternet = await _connectivityChecker.hasInternetAccess();
      if (!hasInternet) {
        print("No internet");
        return const Left('No internet');
      }
      // Make the POST request
      final response = await http.post(uri, headers: headers, body: body);

      // Check the status code
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Successfully registered, parse the response body
        final data = json.decode(response.body);

        final loginModel = RegistrationModel.fromJson(data);
        print(loginModel.user?.name);
        return Right(loginModel);
      } else {
        print('erorr ${response.body}');
        // Server responded with an error, return the error message
        return Left('Error: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('${e.toString()}');
      // Handle any other errors (e.g., network error)
      return Left('Request failed: $e');
    }
  }

  Future<Either<int, int>> logout() async {
    try {
      final hasInternet = await _connectivityChecker.hasInternetAccess();
      if (!hasInternet) {
        return const Left(0);
      }
      final token = await GetSharedPreferences.getAccessToken();
      if (token == null) {
        return const Left(0);
      }

      final response = await http.post(
        Uri.parse('https://cruisebuddy.in/api/v1/logout'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return Right(1);
      } else {
        return Left(0);
      }
    } catch (e) {
      return Left(0);
    }
  }

  Future<Either<String, VerifiedgoogleIdModel>> googleVerifyUid({
    required String idToken,
    required String name,
  }) async {
    try {
      final hasInternet = await _connectivityChecker.hasInternetAccess();
      if (!hasInternet) {
        return const Left('0');
      }

      final response = await http.post(
        Uri.parse('https://cruisebuddy.in/api/v1/google-verify-uid'),
        headers: {'Accept': 'application/json'},
        body: {
          'idToken': idToken,
          'name': name,
          'user_type': 'user',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);

        final verifiedModel = VerifiedgoogleIdModel.fromJson(data);
        print(verifiedModel.user?.name);
        return Right(verifiedModel);
      } else {
        print('Left bject ${response.body}');
        return Left('0');
      }
    } catch (e) {
      print('Left bject ${e.toString()}');
      print('Left bject ${e}');
      return Left('0');
    }
  }
}
