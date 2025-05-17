import 'dart:async';
import 'dart:convert';
import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/featured_shimmer_card.dart';
import 'package:cruise_buddy/UI/Widgets/toast/custom_toast.dart';
import 'package:cruise_buddy/core/db/shared/shared_prefernce.dart';
import 'package:cruise_buddy/core/view_model/addItemToFavourites/add_item_to_favourites_bloc.dart';
import 'package:cruise_buddy/core/view_model/removeItemFromFavourites/remove_item_favourites_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:cruise_buddy/UI/Screens/search%20Results/widgets/amenities_pill.dart';
import 'package:cruise_buddy/UI/Screens/search%20Results/widgets/boat_category_pill.dart';
import 'package:cruise_buddy/UI/Screens/search%20Results/widgets/search_results_container.dart';
import 'package:cruise_buddy/core/constants/colors/app_colors.dart';
import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:cruise_buddy/core/model/favorites_list_model/favorites_list_model.dart';
import 'package:cruise_buddy/core/model/featured_boats_model/featured_boats_model.dart';
import 'package:cruise_buddy/core/view_model/getSearchCruiseResults/get_seached_cruiseresults_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchResultsScreen extends StatefulWidget {
  final String? filterCriteria;
  final String? location;
  final String? startDate;
  final String? endDate;
  final String? maxAmount;
  final String? minAMount;
  final String? fullDayOrDayCruise;
  final String? noOfPassengers;
  final String? noOfRooms;
  final String? premiumOrDeluxe;
  const SearchResultsScreen({
    super.key,
    this.filterCriteria,
    this.location,
    this.startDate,
    this.endDate,
    this.fullDayOrDayCruise,
    this.noOfPassengers,
    this.noOfRooms,
    this.premiumOrDeluxe,
    this.maxAmount,
    this.minAMount,
  });

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  List<double> _scales = [];
  List<bool> isFavoriteList = [];

  final StreamController<FavoritesListModel> _favoritesController =
      StreamController<FavoritesListModel>();

  Set<String> loadingFavorites = {};
  Map<String, String> favoritePackageMap = {};
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

  void toggleFavorite(
      {String? packageId, bool? isFavorite, String? favouriteId}) {
    setState(() {
      loadingFavorites.add(packageId ?? "");
    });

    if (isFavorite ?? false) {
      _removeFromFavorites(favouriteId: favouriteId.toString());
    } else {
      BlocProvider.of<AddItemToFavouritesBloc>(context)
          .add(AddItemToFavouritesEvent.added(packageId: packageId ?? ""));
    }
  }

  void _removeFromFavorites({required String favouriteId}) {
    context
        .read<RemoveItemFavouritesBloc>()
        .add(RemoveItemFavouritesEvent.added(favouritesId: favouriteId));
  }

  Set<String> selectedAmenities = {};
  final List<Map<String, String>> amenitiesData = [
    {'image': 'assets/icons/heater.svg', 'text': 'Heater'},
    {'image': 'assets/icons/projector.svg', 'text': 'Projector'},
    {'image': 'assets/icons/mic.svg', 'text': 'Mic'},
    {'image': 'assets/icons/wifi.svg', 'text': 'WIFI'},
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

  String? selectedCruiseType;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      fetchFavorites();
      BlocProvider.of<GetSeachedCruiseresultsBloc>(context).add(
        GetSeachedCruiseresultsEvent.SeachedCruise(
          location:
              widget.location?.isNotEmpty == true ? widget.location : null,
          maxAmount:
              widget.maxAmount?.isNotEmpty == true ? widget.maxAmount : null,
          minAmount:
              widget.minAMount?.isNotEmpty == true ? widget.minAMount : null,
          startDate:
              widget.startDate?.isNotEmpty == true ? widget.startDate : null,
          endDate: widget.endDate?.isNotEmpty == true ? widget.endDate : null,
          noOfPassengers: widget.noOfPassengers?.isNotEmpty == true
              ? widget.noOfPassengers
              : null,
          noOfRooms:
              widget.noOfRooms?.isNotEmpty == true ? widget.noOfRooms : null,
          premiumOrDeluxe: widget.premiumOrDeluxe?.isNotEmpty == true
              ? widget.premiumOrDeluxe
              : null,
          fullDayorDayCruise: widget.fullDayOrDayCruise?.isNotEmpty == true
              ? widget.fullDayOrDayCruise
              : null,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FavoritesListModel>(
        stream: _favoritesController.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.only(
                  top: 100,
                ),
                child: Center(
                  child: SpinKitWave(
                    color: Colors.blue,
                    size: 50.0,
                  ),
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
                  item.package!.id!.toString(): item.id!.toString()
            };
          }
          return BlocListener<AddItemToFavouritesBloc,
              AddItemToFavouritesState>(
            listener: (context, state) {
              state.map(
                initial: (value) {},
                loading: (value) {},
                addedSuccess: (value) {
                  setState(() {
                    loadingFavorites.remove(value
                        .postedfavouritemitemodel.favorite?.package?.id
                        .toString());
                  });
                  fetchFavorites();
                },
                addedFailure: (value) {
                  setState(() {
                    loadingFavorites.clear();
                  });
                },
                noInternet: (value) {
                  setState(() {
                    loadingFavorites.clear();
                  });
                  // CustomToast.intenetConnectionMissToast(context: context);
                },
              );
            },
            child: BlocListener<RemoveItemFavouritesBloc,
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
                    setState(() {
                      loadingFavorites.clear();
                    });
                  },
                  noInternet: (value) {
                    setState(() {
                      loadingFavorites.clear();
                    });
                  },
                );
              },
              child: Scaffold(
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
                                  icon: const Icon(
                                      Icons.arrow_back_ios_new_rounded),
                                ),
                                const SizedBox(width: 5),
                                SvgPicture.asset('assets/icons/map.svg'),
                                const SizedBox(width: 5),
                                Text(
                                  widget.location.toString() ?? "Kumarakom",
                                  style: TextStyles.ubuntu14black55w400,
                                ),
                                const Spacer(),
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () => _showFilterPopup(
                                      context,
                                      onApplyPressed:
                                          (String minAmount, String maxAmount) {
                                        String? amenitiesName =
                                            selectedAmenities.isNotEmpty
                                                ? selectedAmenities.join(',')
                                                : null;
                                        print('myy ammmy --- ${amenitiesName}');
                                        // Use the selected minAmount and maxAmount as strings
                                        print(
                                            "Selected Min Amount: $minAmount");
                                        print(
                                            "Selected Max Amount: $maxAmount");

                                        // Dispatch the BLoC event with the updated filter values
                                        BlocProvider.of<
                                                    GetSeachedCruiseresultsBloc>(
                                                context)
                                            .add(
                                          GetSeachedCruiseresultsEvent
                                              .SeachedCruise(
                                            location: widget.location,

                                            maxAmount:
                                                maxAmount, // Pass as string
                                            minAmount:
                                                minAmount, // Pass as string
                                            closedOrOpened: selectedCruiseType
                                                ?.toLowerCase(),
                                            amenities: amenitiesName,
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
                                    if (value.packagesearchresults.data ==
                                            null ||
                                        value.packagesearchresults.data!
                                            .isEmpty) {
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
                                              padding:
                                                  const EdgeInsets.all(8.0),
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
                                        horizontal: 16,
                                      ),
                                      child: ListView.builder(
                                        physics: BouncingScrollPhysics(),
                                        itemCount: value
                                            .packagesearchresults.data?.length,
                                        itemBuilder: (context, index) {
                                          final package = value
                                              .packagesearchresults
                                              .data?[index];
                                          final packageId =
                                              package?.id?.toString() ?? '1';
                                          final isFavorite = favoritePackageMap
                                              .containsKey(packageId);
                                          final favouriteId = isFavorite
                                              ? favoritePackageMap[packageId]
                                              : null;

                                          return Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 15,
                                            ),
                                            child: SearchResultsContainer(
                                              packageId: value
                                                      .packagesearchresults
                                                      .data?[index]
                                                      .id
                                                      .toString() ??
                                                  '1',
                                              datum: value.packagesearchresults
                                                      .data?[index] ??
                                                  DatumTest(),
                                              cruisename: value
                                                      .packagesearchresults
                                                      .data?[index]
                                                      .cruise
                                                      ?.name ??
                                                  "N/A",
                                              imageUrl:
                                                  '${value.packagesearchresults.data?[index].cruise?.images?[0].cruiseImg}',
                                              price:
                                                  '${value.packagesearchresults.data?[index].bookingTypes?[0].pricePerDay}',
                                              isFavorite: isFavorite,
                                              favouriteId: favouriteId,
                                              loadingFavorites:
                                                  loadingFavorites,
                                              toggleFavorite: (
                                                      {packageId,
                                                      isFavorite,
                                                      favouriteId}) =>
                                                  toggleFavorite(
                                                packageId: packageId,
                                                isFavorite: isFavorite,
                                                favouriteId: favouriteId,
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
                                            child: SvgPicture.asset(
                                              'assets/icons/cruise_background.svg',
                                              color: const Color.fromARGB(
                                                  255, 181, 235, 233),
                                              fit: BoxFit
                                                  .fill, // or BoxFit.cover
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 150,
                                            child: SvgPicture.asset(
                                              'assets/icons/cruise_background.svg',
                                              color: const Color.fromARGB(
                                                  255, 181, 235, 233),
                                              fit: BoxFit
                                                  .fill, // or BoxFit.cover
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
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        });
  }
}
