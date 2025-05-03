import 'package:cruise_buddy/UI/Screens/layout/sections/boats/widgets/featured_boats_container.dart';
import 'package:flutter/material.dart';
import 'package:cruise_buddy/core/model/featured_boats_model/featured_boats_model.dart';

class AmenityRow extends StatelessWidget {
  final List<Amenity> amenities;

  const AmenityRow({super.key, required this.amenities});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const double pillWidth = 80;
        const double spacing = 5;
        const double pillHeight = 32;
        const double indicatorWidth = 40;

        if (amenities.isEmpty) {
          return SizedBox(height: pillHeight);
        }

        double totalWidth = 0;
        int visibleCount = 0;

        for (int i = 0; i < amenities.length; i++) {
          double nextPillWidth = pillWidth + (visibleCount > 0 ? spacing : 0);
          if (totalWidth + nextPillWidth <= constraints.maxWidth) {
            totalWidth += nextPillWidth;
            visibleCount++;
          } else {
            break;
          }
        }

        int remainingCount = amenities.length - visibleCount;

        // Try to fit +X indicator if remaining items exist
        if (remainingCount > 0) {
          double withIndicator = totalWidth + spacing + indicatorWidth;
          if (withIndicator > constraints.maxWidth && visibleCount > 0) {
            visibleCount--;
            remainingCount++;
          }
        }

        return Wrap(
          spacing: spacing,
          children: [
            ...amenities.take(visibleCount).map((amenity) => PillWidget(
                  image: amenity.icon.toString(),
                  text: amenity.name.toString(),
                )),
            if (remainingCount > 0)
              Container(
                width: indicatorWidth,
                height: pillHeight,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  "+$remainingCount",
                  style: const TextStyle(
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
