import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AmenitiesPill extends StatelessWidget {
  final String image;
  final String text;

  const AmenitiesPill({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 3,
        vertical: 5,
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
          SizedBox(width: 6),
          SvgPicture.asset(
            image,
            width: 14,
            height: 14,
          ),
          SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          SizedBox(width: 8),
        ],
      ),
    );
  }
}
