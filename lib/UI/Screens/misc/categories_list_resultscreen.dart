import 'dart:async';
import 'dart:convert';

import 'package:cruise_buddy/UI/Screens/boat_detail/boat_detail_screen.dart';
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

class CategoriesListResultscreen extends StatefulWidget {
  final String modelName;
  final String location;
  const CategoriesListResultscreen({
    super.key,
    required this.modelName,
    required this.location,
  });

  @override
  State<CategoriesListResultscreen> createState() =>
      _CategoriesListResultscreenState();
}

class _CategoriesListResultscreenState
    extends State<CategoriesListResultscreen> {
  final StreamController<FavoritesListModel> _favoritesController =
      StreamController<FavoritesListModel>();
  Map<String, String> favoritePackageMap = {};
  Set<String> loadingFavorites = {};
  List<bool> isFavoriteList = [];
  @override
  void initState() {
    super.initState();
    print('ddf');
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      fetchFavorites();
      _getUSerData();
      BlocProvider.of<GetSeachedCruiseresultsBloc>(context)
          .add(GetSeachedCruiseresultsEvent.SeachedCruise(
        // foodTitle: 'et',
        //   isVeg: true,
        // amenitiesName: 'dolorum',
        cruiseModelName: widget.modelName,
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

  Future<void> fetchFavorites() async {
    final token = await GetSharedPreferences.getAccessToken();
    final response = await http.get(
      Uri.parse(
          'https://cruisebuddy.in/api/v1/favorite?include=package.cruise'),
      headers: {
        'Accept': 'application/json',
        'CRUISE_AUTH_KEY': '29B37-89DFC5E37A525891-FE788E23',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      final Map<String, dynamic> decodedJson = json.decode(response.body);
      final FavoritesListModel jsonResponse =
          FavoritesListModel.fromJson(decodedJson);
      _favoritesController.add(jsonResponse);

      favoritePackageMap = {
        for (var item in jsonResponse.data ?? [])
          if (item.package?.id != null && item.id != null)
            item.package!.id!.toString(): item.id!.toString()
      };
    } else {
      _favoritesController.addError("Failed to load favorites");
    }
  }

  void _removeFromFavorites({required String favouriteId}) {
    context
        .read<RemoveItemFavouritesBloc>()
        .add(RemoveItemFavouritesEvent.added(favouritesId: favouriteId));
  }

  void toggleFavorite(
      {String? packageId, required bool isFavorite, String? favouriteId}) {
    setState(() {
      loadingFavorites.add(packageId ?? "");
    });

    if (isFavorite) {
      _removeFromFavorites(favouriteId: favouriteId.toString());
    } else {
      BlocProvider.of<AddItemToFavouritesBloc>(context)
          .add(AddItemToFavouritesEvent.added(packageId: packageId ?? ""));
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
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => _showFilterPopup(
                            context,
                            onApplyPressed:
                                (String minAmount, String maxAmount) {
                              // Use the selected minAmount and maxAmount as strings
                              print("Selected Min Amount: $minAmount");
                              print("Selected Max Amount: $maxAmount");
                              String? amenitiesName =
                                  selectedAmenities.isNotEmpty
                                      ? selectedAmenities.join(',')
                                      : null;
                              print('myy ammmy --- ${amenitiesName}');

                              // Dispatch the BLoC event with the updated filter values
                              BlocProvider.of<GetSeachedCruiseresultsBloc>(
                                      context)
                                  .add(
                                GetSeachedCruiseresultsEvent.SeachedCruise(
                                  // filterCriteria: widget.category,
                                  // location: widget.location,
                                  // maxAmount: maxAmount, // Pass as string
                                  // minAmount: minAmount, // Pass as string
                                  cruiseModelName: widget.modelName,
                                  maxPrice: maxAmount, // Pass as string
                                  minPrice: minAmount, // Pass as string
                                  cruiseType: selectedCruiseType?.toLowerCase(),
                                  amenitiesName: amenitiesName,
                                ),
                              );
                            },
                          ),
                          borderRadius: BorderRadius.circular(8),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              "assets/icons/filter.svg",
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: availableHeight,
                  child: StreamBuilder<FavoritesListModel>(
                      stream: _favoritesController.stream,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                        }
                        if (snapshot.hasError) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.wifi_off,
                                  color: Colors.grey,
                                  size: 80,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  "No Internet Connection",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Please check your network and try again.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.teal,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 12),
                                  ),
                                  child: const Text(
                                    "Retry",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        if (snapshot.hasData) {
                          favoritePackageMap = {
                            for (var item in snapshot.data!.data ?? [])
                              if (item.package?.id != null && item.id != null)
                                item.package!.id!.toString():
                                    item.id!.toString()
                          };
                        }

                        return MultiBlocListener(
                          listeners: [
                            BlocListener<AddItemToFavouritesBloc,
                                AddItemToFavouritesState>(
                              listener: (context, state) {
                                state.map(
                                  initial: (value) {},
                                  loading: (value) {},
                                  addedSuccess: (value) {
                                    setState(() {
                                      loadingFavorites.remove(value
                                          .postedfavouritemitemodel
                                          .favorite
                                          ?.package
                                          ?.id
                                          .toString());
                                    });
                                    fetchFavorites();
                                  },
                                  addedFailure: (value) {
                                    CustomToast.errorToast(context: context);

                                    setState(() {
                                      loadingFavorites.clear();
                                    });
                                  },
                                  noInternet: (value) {
                                    setState(() {
                                      loadingFavorites.clear();
                                    });
                                    CustomToast.intenetConnectionMissToast(
                                        context: context);
                                  },
                                );
                              },
                            ),
                            BlocListener<RemoveItemFavouritesBloc,
                                RemoveItemFavouritesState>(
                              listener: (context, state) {
                                state.map(
                                  initial: (value) {},
                                  loading: (value) {},
                                  addedSuccess: (value) {
                                    setState(() {
                                      loadingFavorites.clear();
                                    });
                                    fetchFavorites();
                                  },
                                  addedFailure: (value) {
                                    CustomToast.errorToast(context: context);
                                    setState(() {
                                      loadingFavorites.clear();
                                    });
                                  },
                                  noInternet: (value) {
                                    CustomToast.intenetConnectionMissToast(
                                        context: context);
                                    setState(() {
                                      loadingFavorites.clear();
                                    });
                                  },
                                );
                              },
                            ),
                          ],
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
                                      value
                                          .packagesearchresults.data!.isEmpty) {
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
                                                fit: BoxFit
                                                    .fill, // or BoxFit.cover
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
                                                fit: BoxFit
                                                    .fill, // or BoxFit.cover
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
                                                fit: BoxFit
                                                    .fill, // or BoxFit.cover
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
                                                    style: TextStyles
                                                        .ubuntu18bluew700,
                                                  ),
                                                  Center(
                                                    child: Text(
                                                      "It looks like no cruise are available in this price range.",
                                                      textAlign:
                                                          TextAlign.center,
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      itemCount: value
                                          .packagesearchresults.data?.length,
                                      itemBuilder: (context, index) {
                                        final packageId =
                                            '${value.packagesearchresults.data?[index].id}';

                                        final isFavorite = favoritePackageMap
                                            .containsKey(packageId);
                                        // ignore: unnecessary_null_comparison
                                        final favouriteId = packageId != null
                                            ? favoritePackageMap[packageId]
                                            : null;
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        BoatDetailScreen(
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
                                                                Radius.circular(
                                                                    13),
                                                            topRight:
                                                                Radius.circular(
                                                                    13),
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
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                160, // Consistent height for all states
                                                            child:
                                                                Image.network(
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
                                                                          .images![
                                                                              0]
                                                                          .cruiseImg ??
                                                                      ''
                                                                  : '',
                                                              fit: BoxFit.cover,
                                                              loadingBuilder:
                                                                  (context,
                                                                      child,
                                                                      loadingProgress) {
                                                                if (loadingProgress ==
                                                                    null) {
                                                                  return child;
                                                                }
                                                                return Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height:
                                                                      160, // Same height
                                                                  color: Colors
                                                                          .grey[
                                                                      300], // Background during loading
                                                                  child:
                                                                      const Center(
                                                                    child:
                                                                        CircularProgressIndicator(),
                                                                  ),
                                                                );
                                                              },
                                                              errorBuilder:
                                                                  (context,
                                                                      error,
                                                                      stackTrace) {
                                                                return Container(
                                                                  width: double
                                                                      .infinity,
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
                                                          top: 8,
                                                          right: 8,
                                                          child: InkWell(
                                                            radius: 40,
                                                            onTap: () {
                                                              if (isFavoriteList
                                                                      .length <
                                                                  (value
                                                                          .packagesearchresults
                                                                          .data
                                                                          ?.length ??
                                                                      0)) {
                                                                isFavoriteList = List.generate(
                                                                    value
                                                                        .packagesearchresults
                                                                        .data!
                                                                        .length,
                                                                    (i) =>
                                                                        false);
                                                              }
                                                              toggleFavorite(
                                                                packageId:
                                                                    packageId,
                                                                isFavorite:
                                                                    isFavorite,
                                                                favouriteId:
                                                                    favouriteId,
                                                              );
                                                            },
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              25)),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        5.0),
                                                                child:
                                                                    AnimatedSwitcher(
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  transitionBuilder:
                                                                      (child,
                                                                          animation) {
                                                                    return ScaleTransition(
                                                                        scale:
                                                                            animation,
                                                                        child:
                                                                            child);
                                                                  },
                                                                  child: loadingFavorites
                                                                          .contains(
                                                                              packageId)
                                                                      ? const SizedBox(
                                                                          height:
                                                                              20,
                                                                          width:
                                                                              20,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            strokeWidth:
                                                                                2,
                                                                          ),
                                                                        )
                                                                      : Icon(
                                                                          isFavorite
                                                                              ? Icons.favorite
                                                                              : Icons.favorite_border,
                                                                          color:
                                                                              const Color(0XFF4FC2C5),
                                                                          size:
                                                                              20,
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
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24)),
                                                            child: Row(
                                                              children: [
                                                                SizedBox(
                                                                    width: 10),
                                                                Icon(
                                                                  Icons.star,
                                                                  color: Colors
                                                                      .amber,
                                                                  size: 24,
                                                                ),
                                                                Text(
                                                                  "${(value.packagesearchresults.data?[index].avgRating != null && value.packagesearchresults.data?[index].avgRating.toString() != "null") ? double.parse(value.packagesearchresults.data![index].avgRating.toString()).toStringAsFixed(1) : "4.3"}",
                                                                ),
                                                                SizedBox(
                                                                    width: 10),
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
                                                                        .all(
                                                                        8.0),
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
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 12),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(height: 10),
                                                        AmenityRow(
                                                          amenities: value
                                                                  .packagesearchresults
                                                                  ?.data?[index]
                                                                  ?.amenities
                                                                  ?.map((e) =>
                                                                      Amenity(
                                                                        name: e.name ??
                                                                            '',
                                                                        icon: e.icon ??
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
                                                              "₹${('${value.packagesearchresults.data?[index].bookingTypes?[0].pricePerDay}' == 'null') ? "1000" : '${value.packagesearchresults.data?[index].bookingTypes?[0].pricePerDay}'}",
                                                              style: TextStyles
                                                                  .ubuntu18bluew700,
                                                            ),
                                                            Spacer(),
                                                            SizedBox(
                                                              height: 45,
                                                              child:
                                                                  ElevatedButton(
                                                                onPressed: () {
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) => BookingconfirmationScreen(
                                                                                packageId: value.packagesearchresults.data?[index].id.toString() ?? "53",
                                                                                datum: value.packagesearchresults.data?[index] ?? DatumTest(),
                                                                                name: name, // Pass the name
                                                                                email: email, // Pass the email
                                                                              )));
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
                                                                            .circular(8),
                                                                  ),
                                                                  padding: EdgeInsets.symmetric(
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
                                              fit: BoxFit
                                                  .fill, // or BoxFit.cover
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
                                              fit: BoxFit
                                                  .fill, // or BoxFit.cover
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
                                              fit: BoxFit
                                                  .fill, // or BoxFit.cover
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
                                                  style: TextStyles
                                                      .ubuntu18bluew700,
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
                          ),
                        );
                      }),
                ),
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
