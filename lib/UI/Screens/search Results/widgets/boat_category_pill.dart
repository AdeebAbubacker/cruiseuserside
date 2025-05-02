import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BoatCategoryPill extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const BoatCategoryPill({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Color(0XFF1F8386) : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: const Color(0xFFE2E2E2),
            width: 1.5,
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.ubuntu(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class AmenitiesPillCore extends StatelessWidget {
  final String image;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const AmenitiesPillCore({
    super.key,
    required this.image,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1F8386) : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: const Color(0xFFE2E2E2),
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 6),
            SvgPicture.asset(
              image,
              width: 14,
              height: 14,
              colorFilter: isSelected
                  ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                  : null,
            ),
            const SizedBox(width: 4),
            Text(
              text,
              style: GoogleFonts.ubuntu(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
