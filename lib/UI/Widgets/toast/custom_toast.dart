import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:another_flushbar/flushbar.dart';
class CustomToast {
  static void itemAddedToast({
    required BuildContext context,
   
  }) {
    toastification.showCustom(
      context: context,
      autoCloseDuration: const Duration(seconds: 5),
      alignment: Alignment.bottomCenter,
      builder: (BuildContext context, ToastificationItem holder) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFF1F8386),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          margin: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Item Added to Favourites",
                style: TextStyles.ubuntu12whiteFFw400,
              ),
              const Spacer(),
              TextButton(
                onPressed: null,
                child: Text(
                  "",
                  style: TextStyles.ubuntu12greyFFw800,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static void itemRemovedFromToast({
    required BuildContext context,
  }) {
    toastification.showCustom(
      context: context,
      autoCloseDuration: const Duration(seconds: 5),
      alignment: Alignment.bottomCenter,
      builder: (BuildContext context, ToastificationItem holder) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFF1F8386),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 19,
          ),
          margin: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Item has been removed from favourites",
                style: TextStyles.ubuntu12whiteFFw400,
              ),
              const Spacer(),
            ],
          ),
        );
      },
    );
  }

  static void intenetConnectionMissToast({
    required BuildContext context,
  }) {
    toastification.showCustom(
      context: context,
      autoCloseDuration: const Duration(seconds: 5),
      alignment: Alignment.bottomCenter,
      builder: (BuildContext context, ToastificationItem holder) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFF1F8386),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 19,
          ),
          margin: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "No Internet Connection",
                style: TextStyles.ubuntu12whiteFFw400,
              ),
              const Spacer(),
            ],
          ),
        );
      },
    );
  }

  static void errorToast({
    required BuildContext context,
  }) {
    toastification.showCustom(
      context: context,
      autoCloseDuration: const Duration(seconds: 5),
      alignment: Alignment.bottomCenter,
      builder: (BuildContext context, ToastificationItem holder) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFF1F8386),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 19,
          ),
          margin: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Oops something went wrong, plz try again",
                style: TextStyles.ubuntu12whiteFFw400,
              ),
              const Spacer(),
            ],
          ),
        );
      },
    );
  }
  static void showFlushBar({
    required BuildContext context,
    required bool status,
    required String title,
    required String content,
  }) {
    Flushbar(
      padding: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(12),
      backgroundColor: Colors.white,
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.all(12),
      duration: const Duration(milliseconds: 1900),
      icon: status
          ? const Icon(Icons.check_circle, color: Colors.green, size: 28)
          : const Icon(Icons.cancel, color: Colors.red, size: 28),
      titleText: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Colors.black,
        ),
      ),
      messageText: Text(
        content,
        style: const TextStyle(fontSize: 13, color: Colors.black54),
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 8,
          spreadRadius: 2,
          offset: const Offset(0, 2),
        ),
      ],
    ).show(context);
  }
}



