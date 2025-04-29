import 'package:cruise_buddy/UI/Screens/layout/sections/boats/widgets/featured_boats_container.dart';
import 'package:flutter/material.dart';

class AmenityRow extends StatelessWidget {
  final List<Map<String, dynamic>> amenities;

  const AmenityRow({super.key, required this.amenities});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const double pillWidth = 80; // Estimated width for each pill
        const double spacing = 5;

        // Calculate the maximum number of visible amenities, including space for the "+X"
        int maxPills =
            ((constraints.maxWidth + spacing) / (pillWidth + spacing)).floor();

        // Calculate how many amenities will be visible
        List<Map<String, dynamic>> visibleAmenities =
            amenities.take(maxPills).toList();
        int remainingCount = amenities.length - visibleAmenities.length;
        const double pillHeight = 32;
        // Only show the "+X" if there are more amenities than fit in the available space
        if (amenities.isEmpty) {
          return SizedBox(
            height: pillHeight, // Adjust this if you need extra space
          );
        }
        return Wrap(
          spacing: spacing,
          children: [
            ...visibleAmenities.map(
              (amenity) => PillWidget(
                image: amenity['icon'],
                text: amenity['name'],
              ),
            ),
            if (remainingCount > 0)
              Container(
                width: 24,
                height: 24,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "+$remainingCount",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
