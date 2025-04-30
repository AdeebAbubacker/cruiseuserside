import 'package:cruise_buddy/UI/Screens/boat_detail/boat_detail_screen.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/boats/widgets/aminities_pill_widget.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/boats/widgets/featured_boats_container.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/favourites/favourites_screen.dart';
import 'package:cruise_buddy/UI/Widgets/toast/custom_toast.dart';
import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:cruise_buddy/core/db/shared/shared_prefernce.dart';
import 'package:cruise_buddy/core/model/favorites_list_model/favorites_list_model.dart';
import 'package:cruise_buddy/core/view_model/addItemToFavourites/add_item_to_favourites_bloc.dart';
import 'package:cruise_buddy/core/view_model/listCruiseonLocation/list_cruiseon_location_bloc.dart';
import 'package:cruise_buddy/core/view_model/removeItemFromFavourites/remove_item_favourites_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class LocationsBasedCruiseScreen extends StatefulWidget {
  final String location;
  final String pacakgeId;
  const LocationsBasedCruiseScreen({
    super.key,
    required this.location,
    required this.pacakgeId,
  });

  @override
  State<LocationsBasedCruiseScreen> createState() =>
      _LocationsBasedCruiseScreenState();
}

class _LocationsBasedCruiseScreenState
    extends State<LocationsBasedCruiseScreen> {
  final StreamController<FavoritesListModel> _favoritesController =
      StreamController<FavoritesListModel>();
  Map<String, String> favoritePackageMap = {};
  Set<String> loadingFavorites = {};
  List<bool> isFavoriteList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      fetchFavorites();
      BlocProvider.of<ListCruiseonLocationBloc>(context)
          .add(ListCruiseonLocationEvent.getCruise(location: widget.location));
    });
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
          return MultiBlocListener(
            listeners: [
              BlocListener<ListCruiseonLocationBloc, ListCruiseonLocationState>(
                listener: (context, state) {
                  state.map(
                    initial: (value) {
                      print(value);
                    },
                    loading: (value) {
                      print(value);
                    },
                    getcruiseuccess: (value) {
                      print(value);
                    },
                    getcruiseFailure: (value) {
                      print(value);
                    },
                    noInternet: (value) {
                      print(value);
                    },
                  );
                },
              ),
              BlocListener<AddItemToFavouritesBloc, AddItemToFavouritesState>(
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
                      CustomToast.errorToast(context: context);

                      setState(() {
                        loadingFavorites.clear();
                      });
                    },
                    noInternet: (value) {
                      setState(() {
                        loadingFavorites.clear();
                      });
                      CustomToast.intenetConnectionMissToast(context: context);
                    },
                  );
                },
              ),
              BlocListener<RemoveItemFavouritesBloc, RemoveItemFavouritesState>(
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
                      CustomToast.intenetConnectionMissToast(context: context);
                      setState(() {
                        loadingFavorites.clear();
                      });
                    },
                  );
                },
              ),
            ],
            child: Scaffold(
              appBar: AppBar(
                forceMaterialTransparency: true,
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios)),
                title: Text(widget.location,
                    style: TextStyles.ubuntu32black15w700),
              ),
              body: BlocBuilder<ListCruiseonLocationBloc,
                  ListCruiseonLocationState>(
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

                        return Stack(
                          children: [
                            Positioned(
                              bottom: -40,
                              child: SvgPicture.asset(
                                'assets/icons/cruise_background.svg',
                                color: const Color.fromARGB(255, 196, 238, 237),
                              ),
                            ),
                            Positioned(
                              bottom: 140,
                              child: SvgPicture.asset(
                                'assets/icons/cruise_background.svg',
                                color: const Color.fromARGB(255, 181, 235, 233),
                              ),
                            ),
                            Positioned(
                              bottom: 150,
                              child: SvgPicture.asset(
                                'assets/icons/cruise_background.svg',
                                color: const Color.fromARGB(255, 181, 235, 233),
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
                        );
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: value.cruisemodel.data.length,
                        itemBuilder: (context, index) {
                          final packageId =
                              '${value.cruisemodel.data?[index].id}';

                          final isFavorite =
                              favoritePackageMap.containsKey(packageId);
                          // ignore: unnecessary_null_comparison
                          final favouriteId = packageId != null
                              ? favoritePackageMap[packageId]
                              : null;
                          // return BuildFavouritesCard(
                          //   name:
                          //       value.cruisemodel.data![index].name.toString(),
                          //   imageurl: value.cruisemodel.data![index].cruise
                          //           ?.images?[0].cruiseImg
                          //           .toString() ??
                          //       "",
                          // );
                          final imageUrl = value.cruisemodel.data?[index]
                                      ?.cruise?.images?.isNotEmpty ==
                                  true
                              ? value.cruisemodel.data![index].cruise!
                                  .images![0].cruiseImg
                                  ?.toString()
                              : null;
                          return GestureDetector(
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
                                          height:
                                              160, // Single height control here
                                          color: Colors.grey[
                                              200], // Optional background for error/loading states
                                          child: Image.network(
                                            imageUrl ??
                                                'https://via.placeholder.com/150',
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Container(
                                                width: double.infinity,
                                                height: 160,
                                                color: Colors.grey[300],
                                                child: const Center(
                                                  child: Icon(
                                                      Icons.image_not_supported,
                                                      size: 50),
                                                ),
                                              );
                                            },
                                            loadingBuilder: (context, child,
                                                loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return Container(
                                                width: double.infinity,
                                                height: 160,
                                                color: Colors.grey[300],
                                                child: const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 10,
                                        right: 10,
                                        child: GestureDetector(
                                          onTap: () {
                                            if (isFavoriteList.length <
                                                (value.cruisemodel.data
                                                        ?.length ??
                                                    0)) {
                                              isFavoriteList = List.generate(
                                                  value
                                                      .cruisemodel.data!.length,
                                                  (i) => false);
                                            }
                                            toggleFavorite(
                                              packageId: packageId,
                                              isFavorite: isFavorite,
                                              favouriteId: favouriteId,
                                            );
                                          },
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                            ),
                                            child: Center(
                                              child: AnimatedSwitcher(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                transitionBuilder:
                                                    (child, animation) {
                                                  return ScaleTransition(
                                                      scale: animation,
                                                      child: child);
                                                },
                                                child: loadingFavorites
                                                        .contains(packageId)
                                                    ? const SizedBox(
                                                        height: 20,
                                                        width: 20,
                                                        child:
                                                            CircularProgressIndicator(
                                                          strokeWidth: 2,
                                                        ),
                                                      )
                                                    : Icon(
                                                        isFavorite
                                                            ? Icons.favorite
                                                            : Icons
                                                                .favorite_border,
                                                        color: const Color(
                                                            0XFF4FC2C5),
                                                        size: 20,
                                                      ),
                                              ),
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
                                            borderRadius:
                                                BorderRadius.circular(24),
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
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  6,
                                                )),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "${value.cruisemodel.data![index].name}",
                                                style: TextStyles
                                                    .ubuntu12blue23w700,
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AmenityRow(
                                          amenities: value?.cruisemodel
                                                  .data[index]?.amenities!
                                                  .map((e) => {
                                                        "name": e.name,
                                                        "icon":
                                                            'assets/icons/heater.svg', // Replace with dynamic logic if needed
                                                      })
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
                                                  style: TextStyles
                                                      .ubuntu18bluew700,
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
                                                            BoatDetailScreen(
                                                              packageId: widget
                                                                  .pacakgeId,
                                                            )));
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color(0XFF1F8386),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 16,
                                                  vertical: 12,
                                                ),
                                              ),
                                              child: Text(
                                                "Book Now",
                                                style: TextStyles
                                                    .ubuntu12whiteFFw400,
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
            ),
          );
        });
  }
}

class BuildLocationsCard extends StatelessWidget {
  final String name;
  const BuildLocationsCard({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
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
                  child: Image.asset(
                    "assets/image/fav_screen_img2.png",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 140,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    //  onTap: () => _toggleFavorite(index),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.favorite,
                          color: const Color(0xff4FC2C5),
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      PillWidget(
                        image: 'assets/icons/wifi.svg',
                        text: 'Wifi',
                      ),
                      const SizedBox(width: 5),
                      PillWidget(
                        image: 'assets/icons/heater.svg',
                        text: 'Heater',
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    name,
                    style: TextStyles.ubuntu16black15w500,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "₹5000",
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
                        onPressed: () {},
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
  }
}
