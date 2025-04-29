import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class CustomToast {
  static void itemAddedToast({
    required BuildContext context,
    required VoidCallback onChangeTab,
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
}
