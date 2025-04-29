import 'dart:convert';
import 'dart:io';
import 'package:cruise_buddy/core/constants/functions/connection/connectivity_checker.dart';
import 'package:cruise_buddy/core/db/shared/shared_prefernce.dart';
import 'package:cruise_buddy/core/model/user_profile_model/user_profile_model.dart';
import 'package:cruise_buddy/core/model/user_update_succes_model/user_update_succes_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class UserService {
  final ConnectivityChecker _connectivityChecker = ConnectivityChecker();

  final String url = 'https://cruisebuddy.in/api/v1';

  final Map<String, String> _headers = {
    'Accept': 'application/json',
    'CRUISE_AUTH_KEY': '29B37-89DFC5E37A525891-FE788E23',
    // Bearer token will be added dynamically to the headers
  };

  Future<Either<String, UserProfileModel>> getUserProfile() async {
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
        Uri.parse('$url/current-user'),
        headers: _headers,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);

        final userprofile = UserProfileModel.fromJson(data);

        return Right(userprofile);
      } else {
        print('Request failed: ${response.body.toLowerCase()}');
        return Left('Failed to get cruise type: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Error: $e'); // Handling other errors
    }
  }

  Future<Either<String, UserUpdateSuccesModel>> updateUserProfile({
    String? name,
    String? email,
    String? phone,
    String? image,
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

      final uri = Uri.parse('$url/update-user');

      final request = http.MultipartRequest('POST', uri)
        ..fields['_method'] = 'patch'; // Always needed

      if (name != null) {
        request.fields['name'] = name;
      }
      if (email != null) {
        request.fields['email'] = email;
      }
      if (phone != null) {
        request.fields['phone'] = phone;
      }
     if (image != null && image.isNotEmpty) {
      final file = File(image); // convert string path to File
      request.files.add(await http.MultipartFile.fromPath('image', file.path));
    }

      request.headers.addAll({
        'Accept': 'application/json',
        'CRUISE_AUTH_KEY': '29B37-89DFC5E37A525891-FE788E23',
        'Authorization': 'Bearer $token',
      });

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);
        final userProfile = UserUpdateSuccesModel.fromJson(data);
        print('Request success: ${response.body}');
        return Right(userProfile);
      } else {
        print('Request failed: ${response.body}');
        return Left('Failed to update user profile: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      return Left('Error: $e');
    }
  }
}
