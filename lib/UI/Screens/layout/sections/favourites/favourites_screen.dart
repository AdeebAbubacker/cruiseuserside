import 'dart:async';
import 'dart:convert';
import 'package:cruise_buddy/UI/Screens/layout/sections/boats/widgets/aminities_pill_widget.dart';
import 'package:cruise_buddy/UI/Screens/payment_steps_screen/booking_confirmation_screen.dart';
import 'package:cruise_buddy/UI/Widgets/toast/custom_toast.dart';
import 'package:cruise_buddy/core/db/hive_db/adapters/user_details_adapter.dart';
import 'package:cruise_buddy/core/db/shared/shared_prefernce.dart';
import 'package:cruise_buddy/core/model/favorites_list_model/favorites_list_model.dart';
import 'package:cruise_buddy/core/model/featured_boats_model/featured_boats_model.dart';
import 'package:cruise_buddy/core/view_model/removeItemFromFavourites/remove_item_favourites_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:cruise_buddy/UI/Screens/boat_detail/boat_detail_screen.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/boats/widgets/featured_boats_container.dart';
import 'package:cruise_buddy/UI/Widgets/noDataCondition/no_data_screen.dart';

import 'package:cruise_buddy/core/view_model/getFavouritesList/get_favourites_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  final StreamController<FavoritesListModel> _favoritesController =
      StreamController<FavoritesListModel>();

  List<bool> isFavoriteList = [];
  Set<String> loadingFavorites = {};
  Set<String> clickedFavorites = {};
  Set<String> removedFavorites = {};

  Set<String> lastRemovedFavouriteId = {};
  Map<String, String> favoritePackageMap = {};
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      fetchFavorites();
      _fetchUserData();
      BlocProvider.of<GetFavouritesListBloc>(context)
          .add(GetFavouritesListEvent.getFavouriteboats());
    });
  }

  String name = 'Guest';
  String email = 'N/A';
  Future<void> _fetchUserData() async {
    final box = await Hive.openBox('userDetails');
    final userDetails = box.get('user') as UserDetailsDB?;

    if (userDetails != null) {
      setState(() {
        name = userDetails.name ?? 'Guest';
        email = userDetails.email ?? 'N/A';
      });
    }
  }

  Future<void> fetchFavorites() async {
    final token = await GetSharedPreferences.getAccessToken();
    final response = await http.get(
      Uri.parse(
          'https://cruisebuddy.in/api/v1/favorite?include=user,package.cruise,package.cruise.cruiseType,package.cruise.ratings,package.itineraries,package.amenities,package.food,package.packageImages,package.bookingTypes,package.cruise.cruisesImages,'),
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

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FavoritesListModel>(
      stream: _favoritesController.stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
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
          print('my snapshot ${snapshot.data?.data.toString()}');
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
        if ((snapshot.data?.data ?? []).isEmpty) {
          return NoDataScreen(
              text:
                  "You haven't added any cruises to your favorites yet. Explore our collection and save your top picks for easy access!");
        }

        return BlocListener<RemoveItemFavouritesBloc,
                RemoveItemFavouritesState>(
            listener: (context, state) {
              state.map(
                initial: (value) {},
                loading: (value) {},
                addedSuccess: (value) {
                  setState(() {
                    removedFavorites.addAll(clickedFavorites);
                    clickedFavorites.clear();
                  });

                  CustomToast.itemRemovedFromToast(context: context);
                  setState(() {
                    loadingFavorites.removeWhere(
                        (id) => lastRemovedFavouriteId.contains(id));
                    removedFavorites.addAll(lastRemovedFavouriteId);
                    lastRemovedFavouriteId.clear();
                  });
                  fetchFavorites();
                },
                addedFailure: (value) {
                  CustomToast.errorToast(context: context);
                  setState(() {
                    clickedFavorites.clear();
                  });
                },
                noInternet: (value) {
                  CustomToast.intenetConnectionMissToast(context: context);
                  setState(() {
                    loadingFavorites.removeWhere(
                        (id) => lastRemovedFavouriteId.contains(id));
                    lastRemovedFavouriteId.clear();
                  });
                },
              );
            },
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemCount: snapshot.data?.data
                      ?.where((item) => item.package != null)
                      .length ??
                  0,
              itemBuilder: (context, index) {
                var favourite = snapshot.data?.data
                    ?.where((item) => item.package != null)
                    .toList()[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BoatDetailScreen(
                                  packageId:
                                      "${snapshot.data?.data?[index].package?.id.toString()}",
                                  datum: snapshot.data?.data?[index].package ??
                                      DatumTest(),
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
                              child:
                                  favourite?.package?.cruise?.images != null &&
                                          favourite!.package!.cruise!.images!
                                              .isNotEmpty &&
                                          favourite.package!.cruise!.images![0]
                                                  .cruiseImg !=
                                              null &&
                                          favourite.package!.cruise!.images![0]
                                              .cruiseImg!.isNotEmpty
                                      ? Image.network(
                                          favourite.package!.cruise!.images![0]
                                              .cruiseImg!,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: 160,
                                        )
                                      : Container(
                                          width: double.infinity,
                                          height: 160,
                                          color: Colors.grey[300],
                                          alignment: Alignment.center,
                                          child: Icon(Icons.image_not_supported,
                                              color: Colors.grey[700]),
                                        ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: GestureDetector(
                                onTap: () {
                                  String packageId = snapshot
                                          .data?.data?[index].package?.id
                                          ?.toString() ??
                                      "";
                                  String favouriteId = snapshot
                                          .data?.data?[index].id
                                          ?.toString() ??
                                      "";

                                  if (packageId.isNotEmpty) {
                                    setState(() {
                                      clickedFavorites.add(packageId);
                                    });
                                  }

                                  context.read<RemoveItemFavouritesBloc>().add(
                                        RemoveItemFavouritesEvent.added(
                                            favouritesId: favouriteId),
                                      );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: AnimatedSwitcher(
                                          key: ValueKey<bool>(
                                            loadingFavorites.contains(favourite
                                                    ?.package?.id
                                                    ?.toString() ??
                                                ''),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 300),
                                          transitionBuilder:
                                              (child, animation) {
                                            return ScaleTransition(
                                                scale: animation, child: child);
                                          },
                                          child: loadingFavorites.contains(
                                                  favourite?.package?.id?.toString() ??
                                                      '')
                                              ? const SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child:
                                                      CircularProgressIndicator(
                                                          strokeWidth: 2),
                                                )
                                              : clickedFavorites.contains(
                                                      favourite?.package?.id
                                                              .toString() ??
                                                          "")
                                                  ? SizedBox(
                                                      height: 20,
                                                      width: 20,
                                                      child:
                                                          CircularProgressIndicator(
                                                        strokeWidth: 2,
                                                      ),
                                                    )
                                                  : removedFavorites.contains(
                                                          favourite?.package?.id
                                                                  .toString() ??
                                                              "")
                                                      ? Icon(
                                                          Icons.favorite_border,
                                                          color:
                                                              Color(0XFF4FC2C5))
                                                      : Icon(Icons.favorite,
                                                          color: Color(0XFF4FC2C5)),
                                        )),
                                  ),
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
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 16,
                                    ),
                                    Text("4.3"),
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
                                      "${favourite?.package?.name ?? ""}",
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
                                amenities: favourite?.package?.amenities
                                        ?.map((e) => Amenity(
                                              name: e.name ?? '',
                                              icon: e.icon ?? '',
                                            ))
                                        .toList() ??
                                    [],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                favourite?.package?.cruise?.name ?? "",
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
                                        "₹ ${favourite?.package?.bookingTypes?[0].defaultPrice ?? ""}",
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
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              BookingconfirmationScreen(
                                                name: name,
                                                email: email,
                                            packageId:
                                                "${snapshot.data?.data?[index].package?.id.toString()}",
                                            datum: snapshot.data?.data?[index]
                                                    .package ??
                                                DatumTest(),
                                          ),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0XFF1F8386),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
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
            ));
      },
    );
  }
}
