// ignore_for_file: unrelated_type_equality_checks

import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

class ConnectivityChecker {
  Future<bool> hasInternetAccess() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    // Check if the connectivity result is either WiFi or Mobile
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }

    try {
      final response = await http.get(Uri.parse('https://www.google.com'));
      return response.statusCode == 200;
    } on SocketException {
      return false;
    }
  }
}
