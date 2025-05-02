import 'package:flutter/material.dart';

// class BoatCategoryPill extends StatelessWidget {
//   final String text;

//   const BoatCategoryPill({
//     super.key,
//     required this.text,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: 5,
//         vertical: 8,
//       ),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(25),
//         border: Border.all(
//           color: Color(0xFFE2E2E2),
//           width: 1.5,
//         ),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           SizedBox(width: 10), // Spacing between icon and text
//           Text(
//             text,
//             style: TextStyle(color: Colors.black, fontSize: 14), // Text style
//           ),
//           SizedBox(width: 10),
//         ],
//       ),
//     );
//   }
// }

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
          color: isSelected ? Colors.red : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: const Color(0xFFE2E2E2),
            width: 1.5,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
