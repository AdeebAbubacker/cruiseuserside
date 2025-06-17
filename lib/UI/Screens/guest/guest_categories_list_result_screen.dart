import 'dart:async';
import 'dart:convert';

import 'package:cruise_buddy/UI/Screens/boat_detail/boat_detail_screen.dart';
import 'package:cruise_buddy/UI/Screens/guest/guest_boat_detail_screen.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/featured_shimmer_card.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/boats/widgets/aminities_pill_widget.dart';
import 'package:cruise_buddy/UI/Screens/payment_steps_screen/booking_confirmation_screen.dart';
import 'package:cruise_buddy/UI/Widgets/toast/custom_toast.dart';
import 'package:cruise_buddy/core/db/hive_db/adapters/user_details_adapter.dart';
import 'package:cruise_buddy/core/db/shared/shared_prefernce.dart';
import 'package:cruise_buddy/core/model/favorites_list_model/favorites_list_model.dart';

import 'package:cruise_buddy/core/view_model/addItemToFavourites/add_item_to_favourites_bloc.dart';
import 'package:cruise_buddy/core/view_model/getSearchCruiseResults/get_seached_cruiseresults_bloc.dart';
import 'package:cruise_buddy/core/view_model/removeItemFromFavourites/remove_item_favourites_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cruise_buddy/UI/Screens/search%20Results/widgets/amenities_pill.dart';
import 'package:cruise_buddy/UI/Screens/search%20Results/widgets/boat_category_pill.dart';
import 'package:cruise_buddy/UI/Screens/search%20Results/widgets/search_results_container.dart';
import 'package:cruise_buddy/core/constants/colors/app_colors.dart';
import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

import '../../../core/model/featured_boats_model/featured_boats_model.dart';

class GuestCategoriesListResultScreen extends StatefulWidget {
  final String modelName;
  final String location;
  const GuestCategoriesListResultScreen({
    super.key,
    required this.modelName,
    required this.location,
  });

  @override
  State<GuestCategoriesListResultScreen> createState() =>
      _GuestCategoriesListResultScreenState();
}

class _GuestCategoriesListResultScreenState
    extends State<GuestCategoriesListResultScreen> {
  @override
  void initState() {
    super.initState();
    print('ddf');
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _getUSerData();
      BlocProvider.of<GetSeachedCruiseresultsBloc>(context)
          .add(GetSeachedCruiseresultsEvent.SeachedCruise(
              // foodTitle: 'et',
              //   isVeg: true,
              // amenitiesName: 'dolorum',
              // cruiseModelName: widget.modelName,
              // cruiseType: 'closed',
              // minPrice: '600',
              // maxPrice: '1000',
              //locationName: 'kochi',
              ));
    });
  }

  String name = 'Guest';
  String email = 'N/A';
  late final Box<UserDetailsDB> userDetailsBox;

  Future<void> _getUSerData() async {
    try {
      final userdetailsbox = Hive.box<UserDetailsDB>('userDetailsBox');
      final userDetails = userdetailsbox.get('user');
      if (userDetails != null) {
        setState(() {
          name = userDetails.name ?? 'Guest';
          email = userDetails.email ?? 'N/A';
        });
      }
    } catch (error) {
      print('Error fetching data from Hive: $error');
      // Handle errors appropriately, e.g., display an error message
    }
  }

  String? selectedCruiseType;
  @override
  Widget build(BuildContext context) {
    String truncateString(String? value, int maxLength) {
      if (value == null) {
        return '';
      }
      return value.length > maxLength ? value.substring(0, maxLength) : value;
    }

    return Scaffold(
      backgroundColor: const Color(0XFFF7FFFE),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final totalHeight = constraints.maxHeight;

            final headerHeight = 5 + kToolbarHeight + 20;

            final availableHeight = totalHeight - headerHeight;

            return Column(
              children: [
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      ),
                      const SizedBox(width: 5),
                      const SizedBox(width: 5),
                      // Text(
                      //   widget.category,
                      //   style: TextStyles.ubuntu20black15w600,
                      // ),
                      const Spacer(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                    height: availableHeight,
                    child: BlocBuilder<GetSeachedCruiseresultsBloc,
                        GetSeachedCruiseresultsState>(
                      builder: (context, state) {
                        return state.map(
                          initial: (value) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                top: 100,
                              ),
                              child: Center(
                                child: SpinKitWave(
                                  color: Colors.blue,
                                  size: 50.0,
                                ),
                              ),
                            );
                          },
                          loading: (value) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                top: 100,
                              ),
                              child: Center(
                                child: SpinKitWave(
                                  color: Colors.blue,
                                  size: 50.0,
                                ),
                              ),
                            );
                          },
                          getuseruccess: (value) {
                            if (value.packagesearchresults.data == null ||
                                value.packagesearchresults.data!.isEmpty) {
                              return SizedBox(
                                width: double.infinity,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: -40,
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: SvgPicture.asset(
                                          'assets/icons/cruise_background.svg',
                                          color: const Color.fromARGB(
                                              255, 196, 238, 237),
                                          fit: BoxFit.fill, // or BoxFit.cover
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 140,
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: SvgPicture.asset(
                                          'assets/icons/cruise_background.svg',
                                          color: const Color.fromARGB(
                                              255, 181, 235, 233),
                                          fit: BoxFit.fill, // or BoxFit.cover
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 150,
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: SvgPicture.asset(
                                          'assets/icons/cruise_background.svg',
                                          color: const Color.fromARGB(
                                              255, 181, 235, 233),
                                          fit: BoxFit.fill, // or BoxFit.cover
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                                'assets/icons/not_available_404.svg'),
                                            Text(
                                              "No Cruise Found",
                                              style:
                                                  TextStyles.ubuntu18bluew700,
                                            ),
                                            Center(
                                              child: Text(
                                                "It looks like no cruise are available in this price range.",
                                                textAlign: TextAlign.center,
                                                style: TextStyles
                                                    .ubuntu14black55w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount:
                                    value.packagesearchresults.data?.length,
                                itemBuilder: (context, index) {
                                  final dayCruiseDefaultPrice = (value
                                              .packagesearchresults
                                              .data?[index]
                                              .bookingTypes ??
                                          [])
                                      .firstWhere(
                                    (type) => type.name == 'day_cruise',
                                    orElse: () =>
                                        BookingType(), // Only if BookingType() is valid
                                  );

                                  final packageId =
                                      '${value.packagesearchresults.data?[index].id}';

                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  GuestBoatDetailScreen(
                                                    packageId: value
                                                            .packagesearchresults
                                                            .data?[index]
                                                            .id
                                                            .toString() ??
                                                        "53",
                                                    datum: value
                                                            .packagesearchresults
                                                            .data?[index] ??
                                                        DatumTest(),
                                                  )));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 15,
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        height: 320,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          border: Border.all(
                                            color: Color(0xFFE2E2E2),
                                            width: 1.5,
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 150,
                                              child: Stack(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(13),
                                                      topRight:
                                                          Radius.circular(13),
                                                    ),
                                                    child:
                                                        // Image.network(
                                                        //   '${value.packagesearchresults.data?[index].cruise?.images?[0].cruiseImg}',
                                                        //   width:
                                                        //       double.infinity,
                                                        //   height: 160,
                                                        //   fit: BoxFit.cover,
                                                        //   loadingBuilder:
                                                        //       (context, child,
                                                        //           loadingProgress) {
                                                        //     if (loadingProgress ==
                                                        //         null) {
                                                        //       return child;
                                                        //     }
                                                        //     return Container(
                                                        //       width: double
                                                        //           .infinity,
                                                        //       height: 130,
                                                        //       color: Colors
                                                        //               .grey[
                                                        //           300], // Placeholder background
                                                        //       child: const Center(
                                                        //           child:
                                                        //               CircularProgressIndicator()),
                                                        //     );
                                                        //   },
                                                        //   errorBuilder:
                                                        //       (context, error,
                                                        //           stackTrace) {
                                                        //     return Container(
                                                        //       width: double
                                                        //           .infinity,
                                                        //       height: 130,
                                                        //       decoration:
                                                        //           BoxDecoration(
                                                        //         image:
                                                        //             DecorationImage(
                                                        //           image: AssetImage(
                                                        //               'assets/image/boat_details_img/boat_detail_img.png'),
                                                        //           fit: BoxFit
                                                        //               .cover,
                                                        //         ),
                                                        //       ),
                                                        //     );
                                                        //   },
                                                        // )),
                                                        Container(
                                                      width: double.infinity,
                                                      height:
                                                          160, // Consistent height for all states
                                                      child: Image.network(
                                                        value
                                                                    .packagesearchresults
                                                                    .data?[
                                                                        index]
                                                                    .cruise
                                                                    ?.images
                                                                    ?.isNotEmpty ==
                                                                true
                                                            ? value
                                                                    .packagesearchresults
                                                                    .data![
                                                                        index]
                                                                    .cruise!
                                                                    .images![0]
                                                                    .cruiseImg ??
                                                                ''
                                                            : '',
                                                        fit: BoxFit.cover,
                                                        loadingBuilder: (context,
                                                            child,
                                                            loadingProgress) {
                                                          if (loadingProgress ==
                                                              null) {
                                                            return child;
                                                          }
                                                          return Container(
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                160, // Same height
                                                            color: Colors.grey[
                                                                300], // Background during loading
                                                            child: const Center(
                                                              child:
                                                                  CircularProgressIndicator(),
                                                            ),
                                                          );
                                                        },
                                                        errorBuilder: (context,
                                                            error, stackTrace) {
                                                          return Container(
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                160, // Same height
                                                            decoration:
                                                                const BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                image: AssetImage(
                                                                    'assets/image/boat_details_img/boat_detail_img.png'),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          );
                                                        },
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
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      24)),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(width: 10),
                                                          Icon(
                                                            Icons.star,
                                                            color: Colors.amber,
                                                            size: 24,
                                                          ),
                                                          Text(
                                                            "${(value.packagesearchresults.data?[index].avgRating != null && value.packagesearchresults.data?[index].avgRating.toString() != "null") ? double.parse(value.packagesearchresults.data![index].avgRating.toString()).toStringAsFixed(1) : "4.3"}",
                                                          ),
                                                          SizedBox(width: 10),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                      top: 10,
                                                      left: 10,
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                  6,
                                                                )),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            "${value.packagesearchresults.data?[index].name}",
                                                            style: TextStyles
                                                                .ubuntu12blue23w700,
                                                          ),
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(height: 10),
                                                  AmenityRow(
                                                    amenities: value
                                                            .packagesearchresults
                                                            ?.data?[index]
                                                            ?.amenities
                                                            ?.map(
                                                                (e) => Amenity(
                                                                      name:
                                                                          e.name ??
                                                                              '',
                                                                      icon:
                                                                          e.icon ??
                                                                              '',
                                                                    ))
                                                            .toList() ??
                                                        [],
                                                  ),
                                                  Text(
                                                    truncateString(
                                                        '${value.packagesearchresults.data?[index].cruise?.name}',
                                                        43),
                                                    style: TextStyles
                                                        .ubuntu16black15w500,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "₹${dayCruiseDefaultPrice.defaultPrice ?? "N/A"}",
                                                        style: TextStyles
                                                            .ubuntu18bluew700,
                                                      ),
                                                      Spacer(),
                                                      SizedBox(
                                                        height: 45,
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              const SnackBar(
                                                                content: Text(
                                                                    "Please login to view more details"),
                                                                behavior:
                                                                    SnackBarBehavior
                                                                        .floating,
                                                                duration:
                                                                    Duration(
                                                                        seconds:
                                                                            2),
                                                              ),
                                                            );
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                Color(
                                                                    0XFF1F8386),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        16,
                                                                    vertical:
                                                                        12),
                                                          ),
                                                          child: Text(
                                                            "Book Now",
                                                            style: TextStyles
                                                                .ubuntu12whiteFFw400,
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
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                          getuserFailure: (value) {
                            return SizedBox(
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: -40,
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: SvgPicture.asset(
                                        'assets/icons/cruise_background.svg',
                                        color: const Color.fromARGB(
                                            255, 196, 238, 237),
                                        fit: BoxFit.fill, // or BoxFit.cover
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 140,
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: SvgPicture.asset(
                                        'assets/icons/cruise_background.svg',
                                        color: const Color.fromARGB(
                                            255, 181, 235, 233),
                                        fit: BoxFit.fill, // or BoxFit.cover
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 150,
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: SvgPicture.asset(
                                        'assets/icons/cruise_background.svg',
                                        color: const Color.fromARGB(
                                            255, 181, 235, 233),
                                        fit: BoxFit.fill, // or BoxFit.cover
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/not_available_404.svg'),
                                          Text(
                                            "No Cruise Available",
                                            style: TextStyles.ubuntu18bluew700,
                                          ),
                                          Center(
                                            child: Text(
                                              "It looks like no cruises are available in the ${widget.location} location.",
                                              textAlign: TextAlign
                                                  .center, // Ensures multi-line text is centered
                                              style: TextStyles
                                                  .ubuntu14black55w400, // Optional: Adjust font size or style
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          noInternet: (value) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                top: 100,
                              ),
                              child: Center(child: Text("No Internet")),
                            );
                          },
                        );
                      },
                    )),
              ],
            );
          },
        ),
      ),
    );
  }

  //     AmenitiesPill(
  //       image: ,
  //       text: 'Water Heater',
  //     ),
  //     AmenitiesPill(
  //       image: ,
  //       text: 'Wi-Fi',
  //     ),
  //     AmenitiesPill(
  //       image: 'assets/icons/projector.svg',
  //       text: 'Projector',
  //     ),
  //     AmenitiesPill(
  //       image: 'assets/icons/mic.svg',
  //       text: 'Mic',
  //     ),
  //     AmenitiesPill(
  //       image: 'assets/icons/music.svg',
  //       text: 'Music System',
  //     ),
  //     AmenitiesPill(
  //       image: 'assets/icons/Tv.svg',
  //       text: 'TV',
  //     ),
  //     AmenitiesPill(
  //       image: 'assets/icons/iron_box.svg',
  //       text: 'Iron Box',
  //     ),
  Set<String> selectedAmenities = {};
  final List<Map<String, String>> amenitiesData = [
    {'image': 'assets/icons/heater.svg', 'text': 'Heater'},
    {'image': 'assets/icons/projector.svg', 'text': 'Projector'},
    {'image': 'assets/icons/mic.svg', 'text': 'Mic'},
    {'image': 'assets/icons/wifi.svg', 'text': 'WiFi'},
    {'image': 'assets/icons/food.svg', 'text': 'Food'},
    {'image': 'assets/icons/drinks.svg', 'text': 'Drinks'},
    {'image': 'assets/icons/music.svg', 'text': 'Music'},
    {'image': 'assets/icons/Tv.svg', 'text': 'TV'},
    {'image': 'assets/icons/iron_box.svg', 'text': 'iron Box'},
  ];
  void _showFilterPopup(
    BuildContext context, {
    required Function(String minAmount, String maxAmount) onApplyPressed,
  }) {
    double minPrice = 0; // Default minimum price
    double maxPrice = 120000; // Default maximum price
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              contentPadding: EdgeInsets.zero,
              content: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Price range",
                            style: TextStyles.ubuntu16black15w500,
                          ),
                          Text(
                            '₹ ${minPrice.toInt()} - ${maxPrice.toInt()}',
                            style: TextStyles.ubuntu14black55w400,
                          ),
                          SliderTheme(
                            data: SliderThemeData(
                              trackHeight:
                                  0.8, // General height for both active and inactive tracks

                              thumbColor: ColorConstants
                                  .lightblueC5, // Color of the thumb
                              overlayColor: Colors
                                  .transparent, // You can customize this too if needed
                              tickMarkShape:
                                  RoundSliderTickMarkShape(tickMarkRadius: 2),
                              trackShape:
                                  RectangularSliderTrackShape(), // You can change the shape if necessary
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius:
                                      10), // Customize the thumb
                            ),
                            child: RangeSlider(
                              values: RangeValues(minPrice, maxPrice),
                              min: 0,
                              max: 120000,
                              divisions: 5000000,
                              labels: RangeLabels(
                                minPrice.toInt().toString(),
                                maxPrice.toInt().toString(),
                              ),
                              onChanged: (RangeValues values) {
                                setState(() {
                                  minPrice = values.start;
                                  maxPrice = values.end;
                                });
                              },
                            ),
                          ),
                          Divider(),
                          SizedBox(
                            height: 24,
                          ),
                          Text(
                            "Cruise Type",
                            style: TextStyles.ubuntu16black15w500,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Wrap(
                            spacing: 3,
                            runSpacing: 10,
                            children: [
                              BoatCategoryPill(
                                text: 'Open',
                                isSelected: selectedCruiseType == 'Open',
                                onTap: () {
                                  setState(() {
                                    selectedCruiseType = 'Open';
                                  });
                                },
                              ),
                              BoatCategoryPill(
                                text: 'Closed',
                                isSelected: selectedCruiseType == 'Closed',
                                onTap: () {
                                  setState(() {
                                    selectedCruiseType = 'Closed';
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Text(
                            "Amenities",
                            style: TextStyles.ubuntu16black15w500,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // Wrap(
                          //   spacing: 10,
                          //   runSpacing: 10,
                          //   children: [
                          //     AmenitiesPill(
                          //       image: 'assets/icons/heater.svg',
                          //       text: 'Water Heater',
                          //     ),
                          //     AmenitiesPill(
                          //       image: 'assets/icons/wifi.svg',
                          //       text: 'Wi-Fi',
                          //     ),
                          //     AmenitiesPill(
                          //       image: 'assets/icons/projector.svg',
                          //       text: 'Projector',
                          //     ),
                          //     AmenitiesPill(
                          //       image: 'assets/icons/mic.svg',
                          //       text: 'Mic',
                          //     ),
                          //     AmenitiesPill(
                          //       image: 'assets/icons/music.svg',
                          //       text: 'Music System',
                          //     ),
                          //     AmenitiesPill(
                          //       image: 'assets/icons/Tv.svg',
                          //       text: 'TV',
                          //     ),
                          //     AmenitiesPill(
                          //       image: 'assets/icons/iron_box.svg',
                          //       text: 'Iron Box',
                          //     ),
                          //   ],
                          // ),

                          Wrap(
                            spacing: 6,
                            runSpacing: 10,
                            children: amenitiesData.map((amenity) {
                              final isSelected =
                                  selectedAmenities.contains(amenity['text']);
                              return AmenitiesPillCore(
                                image: amenity['image']!,
                                text: amenity['text']!,
                                isSelected: isSelected,
                                onTap: () {
                                  setState(() {
                                    if (isSelected) {
                                      selectedAmenities.remove(amenity['text']);
                                    } else {
                                      selectedAmenities.add(amenity['text']!);
                                    }
                                  });
                                },
                              );
                            }).toList(),
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: SizedBox(
                              height: 45,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Convert min and max prices to strings of integers
                                  String minAmount =
                                      minPrice.toInt().toString();
                                  String maxAmount =
                                      maxPrice.toInt().toString();

                                  // Pass the selected min and max amounts back to the caller
                                  onApplyPressed(minAmount, maxAmount);
                                  Navigator.of(context).pop();
                                },
                                // () {
                                //   // Call Bloc with filters
                                //   BlocProvider.of<GetSeachedCruiseresultsBloc>(
                                //           context)
                                //       .add(GetSeachedCruiseresultsEvent
                                //           .SeachedCruise(
                                //     filterCriteria: widget.category,
                                //     location: widget.location,
                                //     maxAmount: '0',
                                //     minAmount: '100000',
                                //   ));
                                //   Navigator.of(context).pop();
                                // },

                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0XFF1F8386),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                ),
                                child: Text(
                                  "Show Results",
                                  style: TextStyles.ubuntu12whiteFFw400,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
//---------
