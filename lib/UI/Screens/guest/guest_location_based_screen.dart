import 'package:cruise_buddy/UI/Screens/boat_detail/boat_detail_screen.dart';
import 'package:cruise_buddy/UI/Screens/guest/guest_boat_detail_screen.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/boats/widgets/aminities_pill_widget.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/boats/widgets/featured_boats_container.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/favourites/favourites_screen.dart';
import 'package:cruise_buddy/UI/Screens/payment_steps_screen/booking_confirmation_screen.dart';
import 'package:cruise_buddy/UI/Widgets/toast/custom_toast.dart';
import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:cruise_buddy/core/db/hive_db/adapters/user_details_adapter.dart';
import 'package:cruise_buddy/core/db/shared/shared_prefernce.dart';
import 'package:cruise_buddy/core/model/favorites_list_model/favorites_list_model.dart';
import 'package:cruise_buddy/core/model/featured_boats_model/featured_boats_model.dart';
import 'package:cruise_buddy/core/view_model/addItemToFavourites/add_item_to_favourites_bloc.dart';
import 'package:cruise_buddy/core/view_model/listCruiseonLocation/list_cruiseon_location_bloc.dart';
import 'package:cruise_buddy/core/view_model/removeItemFromFavourites/remove_item_favourites_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class GuestLocationBasedScreen extends StatefulWidget {
  final String location;
  final String pacakgeId;
  const GuestLocationBasedScreen({
    super.key,
    required this.location,
    required this.pacakgeId,
  });

  @override
  State<GuestLocationBasedScreen> createState() =>
      _GuestLocationBasedScreenState();
}

class _GuestLocationBasedScreenState extends State<GuestLocationBasedScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _getUSerData();
      BlocProvider.of<ListCruiseonLocationBloc>(context)
          .add(ListCruiseonLocationEvent.getCruise(location: widget.location));
    });
  }

  String name = 'Guest';
  String email = 'N/A';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text(widget.location, style: TextStyles.ubuntu32black15w700),
      ),
      body: BlocBuilder<ListCruiseonLocationBloc, ListCruiseonLocationState>(
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
            getcruiseuccess: (value) {
              final cruiseData = value.cruisemodel.data;

              if (cruiseData == null || cruiseData.isEmpty) {
                // When there's no data, display a "No data available" message

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
                            color: const Color.fromARGB(255, 196, 238, 237),
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
                            color: const Color.fromARGB(255, 181, 235, 233),
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
                            color: const Color.fromARGB(255, 181, 235, 233),
                            fit: BoxFit.fill, // or BoxFit.cover
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
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
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: value.cruisemodel.data.length,
                itemBuilder: (context, index) {
                  final packageId = '${value.cruisemodel.data?[index].id}';

                  // return BuildFavouritesCard(
                  //   name:
                  //       value.cruisemodel.data![index].name.toString(),
                  //   imageurl: value.cruisemodel.data![index].cruise
                  //           ?.images?[0].cruiseImg
                  //           .toString() ??
                  //       "",
                  // );
                  final imageUrl = value.cruisemodel.data?[index]?.cruise
                              ?.images?.isNotEmpty ==
                          true
                      ? value
                          .cruisemodel.data![index].cruise!.images![0].cruiseImg
                          ?.toString()
                      : null;
                  final String rating =
                      value.cruisemodel.data[index].avgRating.toString();
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GuestBoatDetailScreen(
                                    packageId: widget.pacakgeId,
                                    datum: value.cruisemodel.data[index],
                                  )));
                    },
                    child: Card(
                      color: Color(0xffFFFFFF),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
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
                                    imageUrl ??
                                        'https://via.placeholder.com/150',
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        width: double.infinity,
                                        height: 160,
                                        color: Colors.grey[300],
                                        child: const Center(
                                          child: Icon(Icons.image_not_supported,
                                              size: 50),
                                        ),
                                      );
                                    },
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
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
                              Positioned(
                                bottom: 10,
                                right: 10,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 16,
                                      ),
                                      Text(
                                        "${(value.cruisemodel.data?[index].avgRating != null && value.cruisemodel.data?[index].avgRating.toString() != "null") ? double.parse(value.cruisemodel.data![index].avgRating.toString()).toStringAsFixed(1) : "4.3"}",
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 10,
                                  left: 10,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                          6,
                                        )),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "${value.cruisemodel.data![index].name}",
                                        style: TextStyles.ubuntu12blue23w700,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AmenityRow(
                                  amenities:
                                      value?.cruisemodel.data[index]?.amenities
                                              ?.map((e) => Amenity(
                                                    name: e.name ?? '',
                                                    icon: e.icon ?? '',
                                                  ))
                                              .toList() ??
                                          [],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  value.cruisemodel.data?[index]?.cruise
                                          ?.name ??
                                      "N/A",
                                  style: TextStyles.ubuntu16black15w500,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          value
                                                  .cruisemodel
                                                  .data![index]
                                                  .bookingTypes?[0]
                                                  .defaultPrice ??
                                              "",
                                          style: TextStyles.ubuntu18bluew700,
                                        ),
                                        const Text(
                                          "per night",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    ElevatedButton(
                                      onPressed: () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                "Please login to view more details"),
                                            behavior: SnackBarBehavior.floating,
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             BookingconfirmationScreen(
                                        //               packageId:
                                        //                   widget.pacakgeId,
                                        //               email: email,
                                        //               name: name,
                                        //               datum: value.cruisemodel
                                        //                   .data[index],
                                        //             )));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0XFF1F8386),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 12,
                                        ),
                                      ),
                                      child: Text(
                                        "Book Now",
                                        style: TextStyles.ubuntu12whiteFFw400,
                                      ),
                                    ),
                                  ],
                                ),
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
            getcruiseFailure: (value) {
              return Text("Oops something went wrong");
            },
            noInternet: (value) {
              return Text("No Internet");
            },
          );
        },
      ),
    );
  }
}

// class BuildLocationsCard extends StatelessWidget {
//   final String name;
//   const BuildLocationsCard({
//     super.key,
//     required this.name,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       child: Card(
//         margin: const EdgeInsets.symmetric(vertical: 10),
//         elevation: 2,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(13),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(13),
//                     topRight: Radius.circular(13),
//                   ),
//                   child: Image.asset(
//                     "assets/image/fav_screen_img2.png",
//                     fit: BoxFit.cover,
//                     width: double.infinity,
//                     height: 140,
//                   ),
//                 ),
//                 Positioned(
//                   top: 10,
//                   right: 10,
//                   child: GestureDetector(
//                     //  onTap: () => _toggleFavorite(index),
//                     child: Container(
//                       width: 30,
//                       height: 30,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.white,
//                       ),
//                       child: Center(
//                         child: Icon(
//                           Icons.favorite,
//                           color: const Color(0xff4FC2C5),
//                           size: 24,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 10,
//                   right: 10,
//                   child: Container(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(24),
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: const [
//                         Icon(
//                           Icons.star,
//                           color: Colors.amber,
//                           size: 16,
//                         ),
//                         Text("4.3"),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       PillWidget(
//                         image: 'assets/icons/wifi.svg',
//                         text: 'Wifi',
//                       ),
//                       const SizedBox(width: 5),
//                       PillWidget(
//                         image: 'assets/icons/heater.svg',
//                         text: 'Heater',
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     name,
//                     style: TextStyles.ubuntu16black15w500,
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "₹5000",
//                             style: TextStyles.ubuntu18bluew700,
//                           ),
//                           const Text(
//                             "per night",
//                             style: TextStyle(
//                               color: Colors.grey,
//                               fontSize: 12,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Spacer(),
//                       ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0XFF1F8386),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 16,
//                             vertical: 12,
//                           ),
//                         ),
//                         child: Text(
//                           "Book Now",
//                           style: TextStyles.ubuntu12whiteFFw400,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
