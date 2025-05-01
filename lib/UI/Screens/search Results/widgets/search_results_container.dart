import 'package:cruise_buddy/UI/Screens/boat_detail/boat_detail_screen.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/boats/widgets/aminities_pill_widget.dart';
import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:cruise_buddy/core/model/featured_boats_model/featured_boats_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchResultsContainer extends StatelessWidget {
  final String packageId;
  final String cruisename;
  final String imageUrl;
  final String price;
  final DatumTest datum;
  final bool isFavorite;
  final String? favouriteId;
  final Set<String> loadingFavorites;
  final void Function(
      {String? packageId,
      bool? isFavorite,
      String? favouriteId}) toggleFavorite;

  const SearchResultsContainer({
    required this.packageId,
    this.cruisename = "Kerala’s Heritage Haven – Traditional Kerala Décor",
    required this.imageUrl,
    required this.datum,
    required this.price,
    required this.isFavorite,
    this.favouriteId,
    required this.loadingFavorites,
    required this.toggleFavorite,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String truncateString(String? value, int maxLength) {
      if (value == null) {
        return '';
      }
      return value.length > maxLength ? value.substring(0, maxLength) : value;
    }

    return Container(
      width: double.infinity,
      height: 320,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(
          color: Color(0xFFE2E2E2),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(13),
                    topRight: Radius.circular(13),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 160, // Single height control here
                    color: Colors.grey[
                        200], // Optional background for error/loading states
                    child: Image.network(
                      imageUrl ?? 'https://via.placeholder.com/150',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: double.infinity,
                          height: 160,
                          color: Colors.grey[300],
                          child: const Center(
                            child: Icon(Icons.image_not_supported, size: 50),
                          ),
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Container(
                          width: double.infinity,
                          height: 160,
                          color: Colors.grey[300],
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // Positioned(
                //   top: 8,
                //   right: 8,
                //   child: InkWell(
                //     onTap: () {},
                //     child: Container(
                //       decoration: BoxDecoration(
                //           color: Colors.white,
                //           borderRadius: BorderRadius.circular(25)),
                //       child: Padding(
                //         padding: const EdgeInsets.all(5.0),
                //         child: Icon(
                //           Icons.favorite,
                //           color: Color(0XFF4FC2C5),
                //           size: 20,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),

                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () => toggleFavorite(
                      packageId: packageId,
                      isFavorite: isFavorite,
                      favouriteId: favouriteId,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            transitionBuilder: (child, animation) {
                              return ScaleTransition(
                                  scale: animation, child: child);
                            },
                            child: loadingFavorites.contains(packageId)
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Icon(
                                    isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: const Color(0XFF4FC2C5),
                                    size: 20,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 110,
                  right: 8,
                  child: Container(
                    width: 68,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24)),
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 24,
                        ),
                        Text("4.3"),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                AmenityRow(
                  amenities: datum?.amenities!
                          .map((e) => {
                                "name": e.name,
                                "icon":
                                    'assets/icons/heater.svg', // Replace with dynamic logic if needed
                              })
                          .toList() ??
                      [],
                ),
                SizedBox(height: 5),
                Text(
                  truncateString(cruisename, 43),
                  style: TextStyles.ubuntu16black15w500,
                ),
                Row(
                  children: [
                    Text(
                      "₹${(price == 'null') ? "1000" : price}",
                      style: TextStyles.ubuntu18bluew700,
                    ),
                    Spacer(),
                    SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BoatDetailScreen(
                                  packageId: packageId,
                                  datum: datum,
                                ),
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0XFF1F8386),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                        ),
                        child: Text(
                          "Book Now",
                          style: TextStyles.ubuntu12whiteFFw400,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PillWidget extends StatelessWidget {
  final String image;
  final String text;

  const PillWidget({
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
          SizedBox(width: 8),
          SvgPicture.asset(
            image,
            width: 14,
            height: 14,
          ),

          SizedBox(width: 8), // Spacing between icon and text
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
//-------------test------------------
