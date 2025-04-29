import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/details_delegate.dart';
import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:cruise_buddy/core/view_model/getLocationDetails/get_location_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:async';

class LocationSearchDelegate extends StatefulWidget {
  const LocationSearchDelegate({super.key});

  @override
  State<LocationSearchDelegate> createState() => _LocationSearchDelegateState();
}

class _LocationSearchDelegateState extends State<LocationSearchDelegate> {
  final List<String> locations = [
    "Kochi",
    "Thrissur",
    "Trivandrum",
    "Calicut",
    "Kannur",
    "Alleppey",
    "Kottayam",
  ];

  String query = "";
  List<String> filteredLocations = [];
  Timer? _debounce;
  final TextEditingController _controller = TextEditingController();
  bool isItemSelected = false; // Add this flag

  @override
  void initState() {
    super.initState();
    filteredLocations = locations;

    _controller.addListener(() {
      if (_debounce?.isActive ?? false) _debounce?.cancel();
      _debounce = Timer(const Duration(milliseconds: 300), () {
        final currentQuery = _controller.text.trim();
        if (currentQuery.isNotEmpty && !isItemSelected) {
          // Only call API if no item is selected
          BlocProvider.of<GetLocationDetailsBloc>(context).add(
            GetLocationDetailsEvent.getLocation(locationName: currentQuery),
          );
        } else if (isItemSelected) {
          // Reset the flag after the text is updated
          isItemSelected = false;
        }
      });
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  String? selectedLocation; // Add this variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios_new_sharp),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: 55,
                    child: TextField(
                      style: TextStyles.ubuntu14black55w400,
                      controller: _controller,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: SvgPicture.asset(
                            'assets/icons/search.svg',
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        suffixIcon: query.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  _controller.clear();
                                  setState(() {
                                    query = "";
                                    filteredLocations = locations; // Reset list
                                    selectedLocation = null; // Reset selection
                                  });
                                },
                              )
                            : null,
                        hintText: "Search location...",
                        hintStyle: TextStyles.ubuntu14black55w400,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (selectedLocation != null) ...[
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/location.svg'),
                        const SizedBox(width: 10),
                        Text(
                          "Selected Location: $selectedLocation",
                          style: TextStyles.ubuntu14black55w400,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    const SizedBox(height: 5),
                  ],
                  BlocBuilder<GetLocationDetailsBloc, GetLocationDetailsState>(
                    builder: (context, state) {
                      return state.map(
                        initial: (value) =>
                            buildLocationList(filteredLocations),
                        loading: (value) => const CircularProgressIndicator(),
                        getLocationDetails: (value) => buildLocationList(value
                                .locationmodel.data
                                ?.map((data) => data.name.toString())
                                .toList() ??
                            []),
                        getlocationsFailure: (value) =>
                            buildLocationList(filteredLocations),
                        noInternet: (value) =>
                            buildLocationList(filteredLocations),
                      );
                    },
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      const Color(0XFF1F8386),
                    ),
                  ),
                  onPressed: () {
                    openDetailsDelegate(context);
                  },
                  child: Text(
                    "Continue",
                    style: TextStyles.ubuntu16whiteFFw500,
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget buildLocationList(List<String> locations) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.5,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: SvgPicture.asset('assets/icons/map.svg'),
            title: Text(
              locations[index],
              style: TextStyles.ubuntu14black55w400,
            ),
            onTap: () {
              setState(
                () {
                  isItemSelected = true;
                  _controller.text = locations[index];
                  query = locations[index];
                  filteredLocations = this.locations;
                  filteredLocations = locations;
                  selectedLocation = locations[index];
                },
              );
            },
          );
        },
      ),
    );
  }

  void openDetailsDelegate(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: DetailsDelegate(
              location: selectedLocation.toString(),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 500),
        reverseTransitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }
}
