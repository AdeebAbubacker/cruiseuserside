import 'package:cruise_buddy/UI/Screens/Auth/forgot_password_screen.dart';
import 'package:cruise_buddy/UI/Screens/Auth/login_screens.dart';
import 'package:cruise_buddy/UI/Screens/Auth/signup_screen.dart';
import 'package:cruise_buddy/UI/Screens/On%20Boarding/onboardingscreen_one.dart';
import 'package:cruise_buddy/UI/Screens/On%20Boarding/onboardingscreen_three.dart';
import 'package:cruise_buddy/UI/Screens/On%20Boarding/onboardingscreen_two.dart';
import 'package:cruise_buddy/UI/Screens/boat_detail/boat_detail_screen.dart';
import 'package:cruise_buddy/UI/Screens/layout/main_layout/main_layout.dart';
import '../../../core/model/featured_boats_model/featured_boats_model.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static navigateToOnboardingOne(BuildContext context) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const OnboardingScreenOne()),
    );
  }

  static navigateToOnboardingTwo(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OnboardingScreenTwo()),
    );
  }

  static navigateToOnboardingThree(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OnboardingScreenThree()),
    );
  }

  static navigateToLoginScreen(BuildContext context) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  static navigateToRegistartionScreen(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignupScreen()),
    );
  }

  static navigateToForgotPasswordScreen(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
    );
  }

  static navigateToMainLayoutScreen(BuildContext context) {
    return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => MainLayout(),
      ),
      (route) => false,
    );
  }

  static navigateToBoatdetailScreen(BuildContext context,
      {required Datum datum, required String packageid}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => BoatDetailScreen(
                packageId: packageid,
                datum: datum,
              )),
    );
  }
}
