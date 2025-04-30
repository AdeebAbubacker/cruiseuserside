import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:flutter/material.dart';

class FullWidthRectangleBlueButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const FullWidthRectangleBlueButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            const Color(0xFF1F8386),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyles.ubuntu16whiteFFw500,
        ),
      ),
    );
  }
}
