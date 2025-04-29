import 'package:cruise_buddy/UI/Screens/search%20Results/widgets/amenities_pill.dart';
import 'package:cruise_buddy/UI/Screens/search%20Results/widgets/boat_category_pill.dart';
import 'package:cruise_buddy/UI/Screens/search%20Results/widgets/search_results_container.dart';
import 'package:cruise_buddy/core/constants/colors/app_colors.dart';
import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:cruise_buddy/core/view_model/getSearchCruiseResults/get_seached_cruiseresults_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchResultsScreen extends StatefulWidget {
  final String filterCriteria;
  final String? location;
  const SearchResultsScreen({
    super.key,
    required this.filterCriteria,
    this.location,
  });

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      BlocProvider.of<GetSeachedCruiseresultsBloc>(context).add(
        GetSeachedCruiseresultsEvent.SeachedCruise(
          location: widget.location.toString(),
          filterCriteria: widget.filterCriteria,
          maxAmount: '10000000',
          minAmount: '0',
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
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
                          onTap: () => _showFilterPopup(context),
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: BlocBuilder<GetSeachedCruiseresultsBloc,
                        GetSeachedCruiseresultsState>(
                      builder: (context, state) {
                        return state.map(
                          initial: (value) {
                            return ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: 12,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 15,
                                  ),
                                  child: const SearchResultsContainer(
                                    imageUrl: '',
                                    price: '',
                                  ),
                                );
                              },
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
                              return Stack(
                                children: [
                                  Positioned(
                                    bottom: -40,
                                    child: SvgPicture.asset(
                                      'assets/icons/cruise_background.svg',
                                      color: const Color.fromARGB(
                                          255, 196, 238, 237),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 140,
                                    child: SvgPicture.asset(
                                      'assets/icons/cruise_background.svg',
                                      color: const Color.fromARGB(
                                          255, 181, 235, 233),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 150,
                                    child: SvgPicture.asset(
                                      'assets/icons/cruise_background.svg',
                                      color: const Color.fromARGB(
                                          255, 181, 235, 233),
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
                                            style: TextStyles.ubuntu18bluew700,
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
                              );
                            }
                            return ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount:
                                  value.packagesearchresults.data?.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 15,
                                  ),
                                  child: SearchResultsContainer(
                                    cruisename:
                                        '${value.packagesearchresults.data?[index].name}',
                                    imageUrl:
                                        '${value.packagesearchresults.data?[index].cruise?.images?[0].cruiseImg}',
                                    price:
                                        '${value.packagesearchresults.data?[index].bookingTypes?[0].pricePerDay}',
                                  ),
                                );
                              },
                            );
                          },
                          getuserFailure: (value) {
                            return ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: 12,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 15,
                                  ),
                                  child: const SearchResultsContainer(
                                    imageUrl: '',
                                    price: '',
                                  ),
                                );
                              },
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
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _showFilterPopup(BuildContext context) {
    double _minPrice = 0; // Default minimum price
    double _maxPrice = 120000; // Default maximum price
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
                            '₹ ${_minPrice.toInt()} - ${_maxPrice.toInt()}',
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
                              values: RangeValues(_minPrice, _maxPrice),
                              min: 0,
                              max: 120000,
                              divisions: 5000000,
                              labels: RangeLabels(
                                _minPrice.toInt().toString(),
                                _maxPrice.toInt().toString(),
                              ),
                              onChanged: (RangeValues values) {
                                setState(() {
                                  _minPrice = values.start;
                                  _maxPrice = values.end;
                                });
                              },
                            ),
                          ),
                          Divider(),
                          SizedBox(
                            height: 24,
                          ),
                          Text(
                            "Boat Category",
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
                                text: 'Full Open Upper Deck',
                              ),
                              BoatCategoryPill(
                                text: 'Semi Upper Deck',
                              ),
                              BoatCategoryPill(
                                text: 'No Upper Deck',
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
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              AmenitiesPill(
                                image: 'assets/icons/heater.svg',
                                text: 'Water Heater',
                              ),
                              AmenitiesPill(
                                image: 'assets/icons/wifi.svg',
                                text: 'Wi-Fi',
                              ),
                              AmenitiesPill(
                                image: 'assets/icons/projector.svg',
                                text: 'Projector',
                              ),
                              AmenitiesPill(
                                image: 'assets/icons/mic.svg',
                                text: 'Mic',
                              ),
                              AmenitiesPill(
                                image: 'assets/icons/music.svg',
                                text: 'Music System',
                              ),
                              AmenitiesPill(
                                image: 'assets/icons/Tv.svg',
                                text: 'TV',
                              ),
                              AmenitiesPill(
                                image: 'assets/icons/iron_box.svg',
                                text: 'Iron Box',
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: SizedBox(
                              height: 45,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  BlocProvider.of<GetSeachedCruiseresultsBloc>(
                                          context)
                                      .add(GetSeachedCruiseresultsEvent
                                          .SeachedCruise(
                                    filterCriteria: 'closed',
                                    location: widget.location.toString(),
                                    maxAmount: _maxPrice.toInt().toString(),
                                    minAmount: _minPrice.toInt().toString(),
                                  ));
                                  Navigator.of(context).pop();
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
