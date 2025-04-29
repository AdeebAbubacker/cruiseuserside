import 'package:flutter/material.dart';

class BoatCategoryPill extends StatelessWidget {
  final String text;

  const BoatCategoryPill({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Color(0xFFE2E2E2),
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 10), // Spacing between icon and text
          Text(
            text,
            style: TextStyle(color: Colors.black, fontSize: 14), // Text style
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
