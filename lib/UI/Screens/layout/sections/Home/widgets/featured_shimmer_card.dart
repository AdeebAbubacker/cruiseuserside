import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FeaturedBoatsShimmer extends StatelessWidget {
  final bool isLoading; // To track loading state

  const FeaturedBoatsShimmer({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: isLoading ? 5 : 0, // Show 5 shimmer items when loading
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 30 : 2,
            ),
            child: _buildShimmer(),
          ); // Display shimmer only
        },
      ),
    );
  }

  // Shimmer effect matching the boat card layout
  Widget _buildShimmer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: 240,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            border: Border.all(
              color: const Color(0xFFE2E2E2),
              width: 1.5,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Placeholder
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(13),
                  topRight: Radius.circular(13),
                ),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.grey[300],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title Placeholder
                    Container(
                      width: 150,
                      height: 16,
                      color: Colors.grey[300],
                    ),
                    const SizedBox(height: 5),
                    // Price Placeholder
                    Container(
                      width: 80,
                      height: 18,
                      color: Colors.grey[300],
                    ),
                    const SizedBox(height: 10),
                    // Button Placeholder
                    Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
