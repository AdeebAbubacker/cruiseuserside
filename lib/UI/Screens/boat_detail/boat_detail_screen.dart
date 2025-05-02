import 'dart:io';

import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/booking_selection_widget.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/cruise_selection_widget.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/type_ofday_selection.dart';
import 'package:cruise_buddy/UI/Screens/payment_steps_screen/booking_confirmation_screen.dart';
import 'package:cruise_buddy/UI/Widgets/Button/fullwidth_rectangle_bluebutton.dart';
import 'package:cruise_buddy/UI/Widgets/toast/custom_toast.dart';
import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/model/featured_boats_model/featured_boats_model.dart';

class BoatDetailScreen extends StatefulWidget {
  final String packageId;
  final DatumTest datum;
  const BoatDetailScreen(
      {super.key, required this.packageId, required this.datum});

  @override
  State<BoatDetailScreen> createState() => _BoatDetailScreenState();
}

class _BoatDetailScreenState extends State<BoatDetailScreen> {
  String selectedBookingType = "Day Cruise"; // Default booking type

  // Method to handle booking type selection
  void _onBookingTypeSelected(String bookingType) {
    setState(() {
      selectedBookingType = bookingType;
    });
  }

  List<String> imageUrls = [];

  int _currentIndex = 0;

  final List<Map<String, dynamic>> reviews = [
    {
      "name": "Samantha Payne",
      "username": "@Sam.Payne90",
      "profileImage": null,
      "rating": 4.0,
      "reviewText":
          "Good experience, but could be better. The boat ride was scenic, and we loved the views, but the facilities on board felt a bit outdated. The food was nice, though we expected a bit more variety. A few improvements could make this an amazing experience.",
      "date": "23 Nov 2021",
    },
  ];

  bool showMore = false;
  @override
  void initState() {
    super.initState();

    imageUrls = [
      (widget.datum?.cruise?.images?.isNotEmpty == true
              ? widget.datum!.cruise!.images![0].cruiseImg
              : null) ??
          'assets/image/boat_details_img/boat_detail_img.png',
      ...?widget.datum?.images?.map(
        (e) =>
            e.packageImg ?? 'assets/image/boat_details_img/boat_detail_img.png',
      ),
    ];
  }

  void makeCall(String number, BuildContext context) async {
    final numberWithCountryCode =
        number.startsWith('+') ? number : '+91$number';
    final Uri telUri = Uri(scheme: 'tel', path: numberWithCountryCode);
    try {
      if (Platform.isAndroid || Platform.isIOS) {
        await launchUrl(telUri);
      } else {
        CustomToast.showFlushBar(
          context: context,
          status: false,
          title: "Oops",
          content: 'Phone calls are not supported on this platform',
        );
      }
    } catch (e) {
      CustomToast.showFlushBar(
          context: context,
          status: true,
          title: "Success",
          content: 'An unexpected error occurred');
    }
  }

  @override
  Widget build(BuildContext context) {
    final location = widget.datum?.cruise?.location;

    final address = [
      location?.district,
      location?.name,
      location?.state,
      location?.country
    ].where((part) => part != null && part.trim().isNotEmpty).join(', ');
    Future<LatLng?> _getCoordinatesFromAddress(String address) async {
      try {
        List locations = await locationFromAddress(address);
        if (locations.isNotEmpty) {
          return LatLng(locations.first.latitude, locations.first.longitude);
        }
      } catch (e) {
        print("Geocoding failed: $e");
      }
      return null;
    }

    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        actions: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: GestureDetector(
          //     child: SvgPicture.asset(
          //         'assets/image/boat_details_img/share_icon.svg'),
          //     onTap: () {},
          //   ),
          // ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    itemCount: imageUrls.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final imageUrl = imageUrls[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: imageUrl.startsWith('http')
                              ? Image.network(
                                  imageUrl,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      'assets/image/boat_details_img/boat_detail_img.png',
                                      fit: BoxFit.cover,
                                    );
                                  },
                                )
                              : Image.asset(
                                  imageUrl,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 20,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${_currentIndex + 1}/${imageUrls.length}',
                      style: TextStyles.ubuntu16whitew2700,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '₹ ${widget.datum?.bookingTypes?[0].pricePerDay} / day',
                          style: TextStyles.ubuntublue20w600,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Color(0xffE2E2E2))),
                        child: Row(
                          children: [
                            Icon(Icons.star, size: 16, color: Colors.amber),
                            SizedBox(width: 4),
                            Text(
                              (widget.datum?.avgRating != null &&
                                      widget.datum?.avgRating
                                              .toString()
                                              .toLowerCase() !=
                                          "null")
                                  ? double.parse(
                                          widget.datum!.avgRating.toString())
                                      .toStringAsFixed(1)
                                  : "4.3",
                              style: TextStyles.ubuntu16black23w300,
                            ),
                            SizedBox(width: 4),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.datum?.cruise?.name.toString() ?? "N/A",
                          style: TextStyles.ubuntu16black15w500,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Type of Cruise',
                    style: TextStyles.ubntu16,
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 48,
                    width: MediaQuery.of(context).size.width / 2 - 5,
                    decoration: BoxDecoration(
                      color: Color(0XFFFAFFFF),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.black12,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      widget.datum?.name ?? "N/A",
                      style: TextStyles.ubntu16w300,
                    ),
                  ),
                  SizedBox(height: 25),

                  Row(
                    children: [
                      CircleAvatar(
                        radius: 17.5, // half of 35
                        backgroundImage: AssetImage('assets/Applogo.png'),
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Cruise Ship',
                        style: TextStyles.ubntu16w300,
                      ),
                      Spacer(),
                      SizedBox(width: 9),
                      GestureDetector(
                        onTap: () {
                          makeCall('9072855886', context);
                        },
                        child: SvgPicture.asset(
                            'assets/image/boat_details_img/call_icon.svg'),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Text(
                    'Description',
                    style: TextStyles.ubntu16,
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.datum?.cruise?.description.toString() ?? "N/A",
                    style: TextStyles.ubntu14w300grey,
                  ),
                  SizedBox(height: 15),
                  _buildInfoRow(Icons.people, "Passenger Capacity",
                      "${widget.datum?.cruise?.maxCapacity.toString() ?? "N/A"} Adults"),
                  SizedBox(height: 10),
                  // _buildInfoRow(
                  //     Icons.access_time, "Boat Timing", "09:00 PM - 06:00 AM"),
                  SizedBox(height: 30),
                  Text(
                    "Location",
                    style: TextStyles.ubntu16,
                  ),

                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          address.isNotEmpty ? address : 'Unknown',
                          style: TextStyles.ubntu14w300grey,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 141,
                          width: 92,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.grey.shade200,
                          ),
                          child: Center(
                            child:
                                Icon(Icons.map, size: 50, color: Colors.grey),
                          ),
                        ),
                      ),
                      //         FutureBuilder<LatLng?>(
                      //   future: _getCoordinatesFromAddress(address),
                      //   builder: (context, snapshot) {
                      //     if (snapshot.connectionState ==
                      //         ConnectionState.waiting) {
                      //       return const Center(
                      //           child: CircularProgressIndicator());
                      //     } else if (snapshot.hasData &&
                      //         snapshot.data != null) {
                      //       return SizedBox(
                      //           height: 200,
                      //           child: FlutterMap(
                      //             options: MapOptions(
                      //               cameraConstraint:
                      //                   const CameraConstraint.unconstrained(),
                      //               interactionOptions:
                      //                   const InteractionOptions(),
                      //               backgroundColor: Colors.white,
                      //               // onTap: (LatLng latLng) {
                      //               //   print('Tapped at: $latLng');
                      //               // },
                      //               // onLongPress: (LatLng latLng) {
                      //               //   print('Long press at: $latLng');
                      //               // },
                      //             ),
                      //             children: [
                      //               TileLayer(
                      //                 urlTemplate:
                      //                     "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      //                 subdomains: ['a', 'b', 'c'],
                      //               ),
                      //               MarkerLayer(
                      //                 markers: [
                      //                   Marker(
                      //                     point: LatLng(50.5,
                      //                         30.51), // A placeholder marker
                      //                     width: 40,
                      //                     height: 40,
                      //                     child: const Icon(Icons.location_pin,
                      //                         color: Colors.red, size: 40),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ],
                      //           ));
                      //     } else {
                      //       return const Text('Could not locate map');
                      //     }
                      //   },
                      // )),
                    ],
                  ),
                  const SizedBox(height: 30.0),
                  if ((widget.datum?.amenities?.isNotEmpty ?? false))
                    Text(
                      "Amenities",
                      style: TextStyles.ubntu16,
                    ),

                  const SizedBox(height: 8.0),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2.5,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemCount: widget.datum?.amenities?.length ?? 0,
                    itemBuilder: (context, index) {
                      final amenity = widget.datum!.amenities![index];
                      return _buildAmenityItem(amenity.name);
                    },
                  ),

                  SizedBox(height: 25),
                  Text(
                    "Reviews",
                    style: TextStyles.ubntu16,
                  ),
                  const SizedBox(height: 8.0),
                  Column(
                    children: reviews
                        .map((review) => _buildReviewCard(review))
                        .toList(),
                  ),
                  if (reviews.length > 1)
                    Center(
                      child: TextButton.icon(
                        onPressed: () {
                          setState(() {
                            showMore = !showMore;
                          });
                        },
                        icon: Icon(
                          showMore
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                        ),
                        label: Text(showMore ? "Show less" : "+4 More reviews"),
                      ),
                    ),
                  SizedBox(
                    height: 30,
                  ),
                  FullWidthRectangleBlueButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookingconfirmationScreen(
                                    packageId: widget.packageId,
                                    datum: widget.datum,
                                  )));
                    },
                    text: 'Book Now',
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAmenityItem(dynamic amenity) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(width: 8),
          Expanded(
            child: Text(
              amenity.toString(),
              style: TextStyles.ubntu14w300grey,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String subtitle) {
    return Row(
      children: [
        Icon(icon, color: Colors.black),
        const SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyles.ubntu14w300grey,
            ),
            Text(
              subtitle,
              style: TextStyles.ubntu14w500grey,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAmenityButton(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xffE2E2E2)),
                borderRadius: BorderRadius.circular(28)),
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Icon(icon, color: Color(0xff555555)),
                const SizedBox(width: 10.0),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12.0),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewCard(Map<String, dynamic> review) {
    return Card(
      color: Color(0xffFFFFFF),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20.0,
                ),
                const SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review["name"],
                      style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      review["username"],
                      style: GoogleFonts.ubuntu(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8.0),

            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < review["rating"] ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 16.0,
                );
              }),
            ),
            const SizedBox(height: 8.0),

            // Review Text with "Show More/Less"
            Text(
              review["reviewText"],
              style: GoogleFonts.ubuntu(),
              maxLines: showMore ? null : 15,
              overflow: showMore ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8.0),

            // Review Date
            Text(
              review["date"],
              style: TextStyle(fontSize: 12.0, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
//---------------git_test---------------
