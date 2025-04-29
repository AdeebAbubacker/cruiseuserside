// import 'dart:async';
// import 'dart:convert';

// import 'package:cruise_buddy/UI/Screens/boat_detail/boat_detail_screen.dart';
// import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/featured_shimmer_card.dart';
// import 'package:cruise_buddy/UI/Widgets/toast/custom_toast.dart';
// import 'package:cruise_buddy/core/db/shared/shared_prefernce.dart';
// import 'package:cruise_buddy/core/model/favourites_list_model/favourites_list_model.dart';
// import 'package:cruise_buddy/core/view_model/addItemToFavourites/add_item_to_favourites_bloc.dart';
// import 'package:cruise_buddy/core/view_model/getSearchCruiseResults/get_seached_cruiseresults_bloc.dart';
// import 'package:cruise_buddy/core/view_model/removeItemFromFavourites/remove_item_favourites_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:cruise_buddy/UI/Screens/search%20Results/widgets/amenities_pill.dart';
// import 'package:cruise_buddy/UI/Screens/search%20Results/widgets/boat_category_pill.dart';
// import 'package:cruise_buddy/UI/Screens/search%20Results/widgets/search_results_container.dart';
// import 'package:cruise_buddy/core/constants/colors/app_colors.dart';
// import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:http/http.dart' as http;

// class CategoriesTest extends StatefulWidget {
//   final String category;
//   const CategoriesTest({
//     super.key,
//     required this.category,
//   });

//   @override
//   State<CategoriesTest> createState() => _CategoriesListResultscreenState();
// }

// class _CategoriesListResultscreenState extends State<CategoriesTest> {
//   final StreamController<FavouritesListModel> _favoritesController =
//       StreamController<FavouritesListModel>();
//   Map<String, String> favoritePackageMap = {};
//   Set<String> loadingFavorites = {};
//   List<bool> isFavoriteList = [];
//   @override
//   void initState() {
//     super.initState();

//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       fetchFavorites();
//       BlocProvider.of<GetSeachedCruiseresultsBloc>(context).add(
//           GetSeachedCruiseresultsEvent.SeachedCruise(
//               filterCriteria: widget.category));
//     });
//   }

//   Future<void> fetchFavorites() async {
//     final token = await GetSharedPreferences.getAccessToken();
//     final response = await http.get(
//       Uri.parse(
//           'https://cruisebuddy.in/api/v1/favorite?include=package.cruise'),
//       headers: {
//         'Accept': 'application/json',
//         'CRUISE_AUTH_KEY': '29B37-89DFC5E37A525891-FE788E23',
//         'Authorization': 'Bearer $token',
//       },
//     );

//     if (response.statusCode == 201 || response.statusCode == 200) {
//       final Map<String, dynamic> decodedJson = json.decode(response.body);
//       final FavouritesListModel jsonResponse =
//           FavouritesListModel.fromJson(decodedJson);
//       _favoritesController.add(jsonResponse);

//       favoritePackageMap = {
//         for (var item in jsonResponse.data ?? [])
//           if (item.package?.id != null && item.id != null)
//             item.package!.id!.toString(): item.id!.toString()
//       };
//     } else {
//       _favoritesController.addError("Failed to load favorites");
//     }
//   }

//   void _removeFromFavorites({required String favouriteId}) {
//     context
//         .read<RemoveItemFavouritesBloc>()
//         .add(RemoveItemFavouritesEvent.added(favouritesId: favouriteId));
//   }

//   void toggleFavorite(
//       {String? packageId, required bool isFavorite, String? favouriteId}) {
//     setState(() {
//       loadingFavorites.add(packageId ?? "");
//     });

//     if (isFavorite) {
//       _removeFromFavorites(favouriteId: favouriteId.toString());
//     } else {
//       BlocProvider.of<AddItemToFavouritesBloc>(context)
//           .add(AddItemToFavouritesEvent.added(packageId: packageId ?? ""));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     String truncateString(String? value, int maxLength) {
//       if (value == null) {
//         return '';
//       }
//       return value.length > maxLength ? value.substring(0, maxLength) : value;
//     }

//     return Scaffold(
//       backgroundColor: const Color(0XFFF7FFFE),
//       body: SafeArea(
//         child: LayoutBuilder(
//           builder: (context, constraints) {
//             final totalHeight = constraints.maxHeight;

//             final headerHeight = 5 + kToolbarHeight + 20;

//             final availableHeight = totalHeight - headerHeight;

//             return Column(
//               children: [
//                 const SizedBox(height: 5),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 10),
//                   child: Row(
//                     children: [
//                       IconButton(
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                         },
//                         icon: const Icon(Icons.arrow_back_ios_new_rounded),
//                       ),
//                       const SizedBox(width: 5),
//                       const SizedBox(width: 5),
//                       // Text(
//                       //   widget.category,
//                       //   style: TextStyles.ubuntu20black15w600,
//                       // ),
//                       const Spacer(),
//                       Material(
//                         color: Colors.transparent,
//                         child: InkWell(
//                           onTap: () => _showFilterPopup(context),
//                           borderRadius: BorderRadius.circular(8),
//                           child: Padding(
//                             padding: const EdgeInsets.all(12.0),
//                             child: SvgPicture.asset(
//                               "assets/icons/filter.svg",
//                               height: 20,
//                               width: 20,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 SizedBox(
//                   height: availableHeight,
//                   child: StreamBuilder<FavouritesListModel>(
//                       stream: _favoritesController.stream,
//                       builder: (context, snapshot) {
//                         if (snapshot.connectionState ==
//                             ConnectionState.waiting) {
//                           return Padding(
//                             padding: const EdgeInsets.only(
//                               top: 100,
//                             ),
//                             child: Center(
//                               child: SpinKitWave(
//                                 color: Colors.blue,
//                                 size: 50.0,
//                               ),
//                             ),
//                           );
//                         }
//                         if (snapshot.hasError) {
//                           return Center(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(
//                                   Icons.wifi_off,
//                                   color: Colors.grey,
//                                   size: 80,
//                                 ),
//                                 const SizedBox(height: 20),
//                                 Text(
//                                   "No Internet Connection",
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.grey[700],
//                                   ),
//                                 ),
//                                 const SizedBox(height: 10),
//                                 Text(
//                                   "Please check your network and try again.",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.grey[600],
//                                   ),
//                                 ),
//                                 const SizedBox(height: 20),
//                                 ElevatedButton(
//                                   onPressed: () {},
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.teal,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 24, vertical: 12),
//                                   ),
//                                   child: const Text(
//                                     "Retry",
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         }
//                         if (snapshot.hasData) {
//                           favoritePackageMap = {
//                             for (var item in snapshot.data!.data ?? [])
//                               if (item.package?.id != null && item.id != null)
//                                 item.package!.id!.toString():
//                                     item.id!.toString()
//                           };
//                         }

//                         return MultiBlocListener(
//                           listeners: [
//                             BlocListener<AddItemToFavouritesBloc,
//                                 AddItemToFavouritesState>(
//                               listener: (context, state) {
//                                 state.map(
//                                   initial: (value) {},
//                                   loading: (value) {},
//                                   addedSuccess: (value) {
//                                     CustomToast.itemAddedToast(
//                                         context: context, onChangeTab: () {});
//                                     setState(() {
//                                       loadingFavorites.remove(value
//                                           .postedfavouritemitemodel
//                                           .favorite
//                                           ?.package
//                                           ?.id
//                                           .toString());
//                                     });
//                                     fetchFavorites();
//                                   },
//                                   addedFailure: (value) {
//                                     CustomToast.errorToast(context: context);

//                                     setState(() {
//                                       loadingFavorites.clear();
//                                     });
//                                   },
//                                   noInternet: (value) {
//                                     setState(() {
//                                       loadingFavorites.clear();
//                                     });
//                                     CustomToast.intenetConnectionMissToast(
//                                         context: context);
//                                   },
//                                 );
//                               },
//                             ),
//                             BlocListener<RemoveItemFavouritesBloc,
//                                 RemoveItemFavouritesState>(
//                               listener: (context, state) {
//                                 state.map(
//                                   initial: (value) {},
//                                   loading: (value) {},
//                                   addedSuccess: (value) {
//                                     CustomToast.itemRemovedFromToast(
//                                         context: context);
//                                     setState(() {
//                                       loadingFavorites.clear();
//                                     });
//                                     fetchFavorites();
//                                   },
//                                   addedFailure: (value) {
//                                     CustomToast.errorToast(context: context);
//                                     setState(() {
//                                       loadingFavorites.clear();
//                                     });
//                                   },
//                                   noInternet: (value) {
//                                     CustomToast.intenetConnectionMissToast(
//                                         context: context);
//                                     setState(() {
//                                       loadingFavorites.clear();
//                                     });
//                                   },
//                                 );
//                               },
//                             ),
//                           ],
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 16),
//                             child: BlocBuilder<GetSeachedCruiseresultsBloc,
//                                 GetSeachedCruiseresultsState>(
//                               builder: (context, state) {
//                                 return state.map(
//                                   initial: (value) {
//                                     return ListView.builder(
//                                       physics: BouncingScrollPhysics(),
//                                       itemCount: 12,
//                                       itemBuilder: (context, index) {
//                                         return Padding(
//                                           padding: const EdgeInsets.only(
//                                             bottom: 15,
//                                           ),
//                                           child: const SearchResultsContainer(
//                                             price: '',
//                                             imageUrl: '',
//                                           ),
//                                         );
//                                       },
//                                     );
//                                   },
//                                   loading: (value) {
//                                     return Padding(
//                                       padding: const EdgeInsets.only(
//                                         top: 100,
//                                       ),
//                                       child: Center(
//                                         child: SpinKitWave(
//                                           color: Colors.blue,
//                                           size: 50.0,
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                   getuseruccess: (value) {
//                                     return ListView.builder(
//                                       physics: BouncingScrollPhysics(),
//                                       itemCount: value
//                                           .packagesearchresults.data?.length,
//                                       itemBuilder: (context, index) {
//                                         final packageId =
//                                             '${value.packagesearchresults.data?[index].id}';

//                                         final isFavorite = favoritePackageMap
//                                             .containsKey(packageId);
//                                         // ignore: unnecessary_null_comparison
//                                         final favouriteId = packageId != null
//                                             ? favoritePackageMap[packageId]
//                                             : null;
//                                         return Padding(
//                                           padding: const EdgeInsets.only(
//                                             bottom: 15,
//                                           ),
//                                           child: Container(
//                                             width: double.infinity,
//                                             height: 320,
//                                             decoration: BoxDecoration(
//                                               color: Colors.white,
//                                               borderRadius:
//                                                   BorderRadius.circular(13),
//                                               border: Border.all(
//                                                 color: Color(0xFFE2E2E2),
//                                                 width: 1.5,
//                                               ),
//                                             ),
//                                             child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 SizedBox(
//                                                   height: 150,
//                                                   child: Stack(
//                                                     children: [
//                                                       ClipRRect(
//                                                           borderRadius:
//                                                               BorderRadius.only(
//                                                             topLeft:
//                                                                 Radius.circular(
//                                                                     13),
//                                                             topRight:
//                                                                 Radius.circular(
//                                                                     13),
//                                                           ),
//                                                           child: Image.network(
//                                                             '${value.packagesearchresults.data?[index].cruise?.images?[0].cruiseImg}',
//                                                             width:
//                                                                 double.infinity,
//                                                             height: 160,
//                                                             fit: BoxFit.cover,
//                                                             loadingBuilder:
//                                                                 (context, child,
//                                                                     loadingProgress) {
//                                                               if (loadingProgress ==
//                                                                   null)
//                                                                 return child;
//                                                               return Container(
//                                                                 width: double
//                                                                     .infinity,
//                                                                 height: 130,
//                                                                 color: Colors
//                                                                         .grey[
//                                                                     300], // Placeholder background
//                                                                 child: const Center(
//                                                                     child:
//                                                                         CircularProgressIndicator()),
//                                                               );
//                                                             },
//                                                             errorBuilder:
//                                                                 (context, error,
//                                                                     stackTrace) {
//                                                               return Container(
//                                                                 width: double
//                                                                     .infinity,
//                                                                 height: 130,
//                                                                 decoration:
//                                                                     BoxDecoration(
//                                                                   image:
//                                                                       DecorationImage(
//                                                                     image: AssetImage(
//                                                                         'assets/image/boat_details_img/boat_detail_img.png'),
//                                                                     fit: BoxFit
//                                                                         .cover,
//                                                                   ),
//                                                                 ),
//                                                               );
//                                                             },
//                                                           )),
//                                                       Positioned(
//                                                         top: 8,
//                                                         right: 8,
//                                                         child: InkWell(
//                                                           radius: 40,
//                                                           onTap: () {
//                                                             if (isFavoriteList
//                                                                     .length <
//                                                                 (value
//                                                                         .packagesearchresults
//                                                                         .data
//                                                                         ?.length ??
//                                                                     0)) {
//                                                               isFavoriteList =
//                                                                   List.generate(
//                                                                       value
//                                                                           .packagesearchresults
//                                                                           .data!
//                                                                           .length,
//                                                                       (i) =>
//                                                                           false);
//                                                             }
//                                                             toggleFavorite(
//                                                               packageId:
//                                                                   packageId,
//                                                               isFavorite:
//                                                                   isFavorite,
//                                                               favouriteId:
//                                                                   favouriteId,
//                                                             );
//                                                           },
//                                                           child: Container(
//                                                             decoration: BoxDecoration(
//                                                                 color: Colors
//                                                                     .white,
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             25)),
//                                                             child: Padding(
//                                                               padding:
//                                                                   const EdgeInsets
//                                                                       .all(5.0),
//                                                               child:
//                                                                   AnimatedSwitcher(
//                                                                 duration:
//                                                                     const Duration(
//                                                                         milliseconds:
//                                                                             300),
//                                                                 transitionBuilder:
//                                                                     (child,
//                                                                         animation) {
//                                                                   return ScaleTransition(
//                                                                       scale:
//                                                                           animation,
//                                                                       child:
//                                                                           child);
//                                                                 },
//                                                                 child: loadingFavorites
//                                                                         .contains(
//                                                                             packageId)
//                                                                     ? const SizedBox(
//                                                                         height:
//                                                                             20,
//                                                                         width:
//                                                                             20,
//                                                                         child:
//                                                                             CircularProgressIndicator(
//                                                                           strokeWidth:
//                                                                               2,
//                                                                         ),
//                                                                       )
//                                                                     : Icon(
//                                                                         isFavorite
//                                                                             ? Icons.favorite
//                                                                             : Icons.favorite_border,
//                                                                         color: const Color(
//                                                                             0XFF4FC2C5),
//                                                                         size:
//                                                                             20,
//                                                                       ),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       Positioned(
//                                                         top: 110,
//                                                         right: 8,
//                                                         child: Container(
//                                                           width: 68,
//                                                           height: 30,
//                                                           decoration: BoxDecoration(
//                                                               color:
//                                                                   Colors.white,
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           24)),
//                                                           child: Row(
//                                                             children: [
//                                                               SizedBox(
//                                                                   width: 10),
//                                                               Icon(
//                                                                 Icons.star,
//                                                                 color: Colors
//                                                                     .amber,
//                                                                 size: 24,
//                                                               ),
//                                                               Text("4.3"),
//                                                               SizedBox(
//                                                                   width: 10),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 Padding(
//                                                   padding: const EdgeInsets
//                                                       .symmetric(
//                                                       horizontal: 12),
//                                                   child: Column(
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .start,
//                                                     children: [
//                                                       SizedBox(height: 10),
//                                                       Row(
//                                                         children: [
//                                                           PillWidget(
//                                                             image:
//                                                                 'assets/icons/wifi.svg',
//                                                             text: 'Wifi',
//                                                           ),
//                                                           SizedBox(
//                                                             width: 5,
//                                                           ),
//                                                           PillWidget(
//                                                             image:
//                                                                 'assets/icons/heater.svg',
//                                                             text: 'Heater',
//                                                           ),
//                                                         ],
//                                                       ),
//                                                       Text(
//                                                         truncateString(
//                                                             '${value.packagesearchresults.data?[index].cruise?.name}',
//                                                             43),
//                                                         style: TextStyles
//                                                             .ubuntu16black15w500,
//                                                       ),
//                                                       Row(
//                                                         children: [
//                                                           Text(
//                                                             "₹${('${value.packagesearchresults.data?[index].bookingTypes?[0].pricePerDay}' == null || '${value.packagesearchresults.data?[index].bookingTypes?[0].pricePerDay}' == 'null') ? "1000" : '${value.packagesearchresults.data?[index].bookingTypes?[0].pricePerDay}'}",
//                                                             style: TextStyles
//                                                                 .ubuntu18bluew700,
//                                                           ),
//                                                           Spacer(),
//                                                           SizedBox(
//                                                             height: 45,
//                                                             child:
//                                                                 ElevatedButton(
//                                                               onPressed: () {
//                                                                 Navigator.push(
//                                                                     context,
//                                                                     MaterialPageRoute(
//                                                                         builder:
//                                                                             (context) =>
//                                                                                 BoatDetailScreen()));
//                                                               },
//                                                               style:
//                                                                   ElevatedButton
//                                                                       .styleFrom(
//                                                                 backgroundColor:
//                                                                     Color(
//                                                                         0XFF1F8386),
//                                                                 shape:
//                                                                     RoundedRectangleBorder(
//                                                                   borderRadius:
//                                                                       BorderRadius
//                                                                           .circular(
//                                                                               8),
//                                                                 ),
//                                                                 padding: EdgeInsets
//                                                                     .symmetric(
//                                                                         horizontal:
//                                                                             16,
//                                                                         vertical:
//                                                                             12),
//                                                               ),
//                                                               child: Text(
//                                                                 "Book Now",
//                                                                 style: TextStyles
//                                                                     .ubuntu12whiteFFw400,
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       )
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                     );
//                                   },
//                                   getuserFailure: (value) {
//                                     return ListView.builder(
//                                       physics: BouncingScrollPhysics(),
//                                       itemCount: 12,
//                                       itemBuilder: (context, index) {
//                                         return Padding(
//                                           padding: const EdgeInsets.only(
//                                             bottom: 15,
//                                           ),
//                                           child: const SearchResultsContainer(
//                                             imageUrl: 'ss',
//                                             price: '',
//                                           ),
//                                         );
//                                       },
//                                     );
//                                   },
//                                   noInternet: (value) {
//                                     return Padding(
//                                       padding: const EdgeInsets.only(
//                                         top: 100,
//                                       ),
//                                       child: Center(child: Text("No Internet")),
//                                     );
//                                   },
//                                 );
//                               },
//                             ),
//                           ),
//                         );
//                       }),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }

//   void _showFilterPopup(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         double _minPrice = 3000; // Default minimum price
//         double _maxPrice = 50000; // Default maximum price

//         return StatefulBuilder(
//           builder: (BuildContext context, StateSetter setState) {
//             return AlertDialog(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               contentPadding: EdgeInsets.zero,
//               content: SizedBox(
//                 width: MediaQuery.sizeOf(context).width,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         IconButton(
//                           icon: const Icon(Icons.close),
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                         ),
//                       ],
//                     ),
//                     Container(
//                       width: MediaQuery.of(context).size.width * 0.9,
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 16,
//                       ),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Price range",
//                             style: TextStyles.ubuntu16black15w500,
//                           ),
//                           Text(
//                             '₹ ${_minPrice.toInt()} - ${_maxPrice.toInt()}',
//                             style: TextStyles.ubuntu14black55w400,
//                           ),
//                           SliderTheme(
//                             data: SliderThemeData(
//                               trackHeight:
//                                   0.8, // General height for both active and inactive tracks

//                               thumbColor: ColorConstants
//                                   .lightblueC5, // Color of the thumb
//                               overlayColor: Colors
//                                   .transparent, // You can customize this too if needed
//                               tickMarkShape:
//                                   RoundSliderTickMarkShape(tickMarkRadius: 2),
//                               trackShape:
//                                   RectangularSliderTrackShape(), // You can change the shape if necessary
//                               thumbShape: RoundSliderThumbShape(
//                                   enabledThumbRadius:
//                                       10), // Customize the thumb
//                             ),
//                             child: RangeSlider(
//                               values: RangeValues(_minPrice, _maxPrice),
//                               min: 3000,
//                               max: 50000,
//                               divisions: 5000000,
//                               labels: RangeLabels(
//                                 _minPrice.toInt().toString(),
//                                 _maxPrice.toInt().toString(),
//                               ),
//                               onChanged: (RangeValues values) {
//                                 setState(() {
//                                   _minPrice = values.start;
//                                   _maxPrice = values.end;
//                                 });
//                               },
//                             ),
//                           ),
//                           Divider(),
//                           SizedBox(
//                             height: 24,
//                           ),
//                           Text(
//                             "Boat Category",
//                             style: TextStyles.ubuntu16black15w500,
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Wrap(
//                             spacing: 3,
//                             runSpacing: 10,
//                             children: [
//                               BoatCategoryPill(
//                                 text: 'Full Open Upper Deck',
//                               ),
//                               BoatCategoryPill(
//                                 text: 'Semi Upper Deck',
//                               ),
//                               BoatCategoryPill(
//                                 text: 'No Upper Deck',
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 24,
//                           ),
//                           Text(
//                             "Amenities",
//                             style: TextStyles.ubuntu16black15w500,
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Wrap(
//                             spacing: 10,
//                             runSpacing: 10,
//                             children: [
//                               AmenitiesPill(
//                                 image: 'assets/icons/heater.svg',
//                                 text: 'Water Heater',
//                               ),
//                               AmenitiesPill(
//                                 image: 'assets/icons/wifi.svg',
//                                 text: 'Wi-Fi',
//                               ),
//                               AmenitiesPill(
//                                 image: 'assets/icons/projector.svg',
//                                 text: 'Projector',
//                               ),
//                               AmenitiesPill(
//                                 image: 'assets/icons/mic.svg',
//                                 text: 'Mic',
//                               ),
//                               AmenitiesPill(
//                                 image: 'assets/icons/music.svg',
//                                 text: 'Music System',
//                               ),
//                               AmenitiesPill(
//                                 image: 'assets/icons/Tv.svg',
//                                 text: 'TV',
//                               ),
//                               AmenitiesPill(
//                                 image: 'assets/icons/iron_box.svg',
//                                 text: 'Iron Box',
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 20),
//                           Center(
//                             child: SizedBox(
//                               height: 45,
//                               width: double.infinity,
//                               child: ElevatedButton(
//                                 onPressed: () {
//                                   Navigator.of(context).pop();
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Color(0XFF1F8386),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                   ),
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 16, vertical: 12),
//                                 ),
//                                 child: Text(
//                                   "Show Results",
//                                   style: TextStyles.ubuntu12whiteFFw400,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 30),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
