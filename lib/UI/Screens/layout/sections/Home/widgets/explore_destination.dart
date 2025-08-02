import 'package:cruise_buddy/UI/Screens/misc/locations_based_cruise.dart';
import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:cruise_buddy/core/helper/common_helper.dart';
import 'package:cruise_buddy/core/view_model/getLocationDetails/get_location_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

List<ExploreDestinationmodel> exploreDestination = [
  const ExploreDestinationmodel(
    image: 'assets/image/onboarding_img/onboarding_one.png',
    place: 'Alleppey',
  ),
  const ExploreDestinationmodel(
    image: 'assets/image/onboarding_img/onboarding_one.png',
    place: 'Alleppey',
  ),
  const ExploreDestinationmodel(
    image: 'assets/image/onboarding_img/onboarding_one.png',
    place: 'Alleppey',
  ),
  const ExploreDestinationmodel(
    image: 'assets/image/onboarding_img/onboarding_one.png',
    place: 'Alleppey',
  ),
  const ExploreDestinationmodel(
    image: 'assets/image/onboarding_img/onboarding_one.png',
    place: 'Alleppey',
  ),
  const ExploreDestinationmodel(
    image: 'assets/image/onboarding_img/onboarding_one.png',
    place: 'Alleppey',
  ),
  const ExploreDestinationmodel(
    image: 'assets/image/onboarding_img/onboarding_one.png',
    place: 'Alleppey',
  ),
  const ExploreDestinationmodel(
    image: 'assets/image/onboarding_img/onboarding_one.png',
    place: 'Alleppey',
  ),
  const ExploreDestinationmodel(
    image: 'assets/image/onboarding_img/onboarding_one.png',
    place: 'Alleppey',
  ),
  const ExploreDestinationmodel(
    image: 'assets/image/onboarding_img/onboarding_one.png',
    place: 'Alleppey',
  ),
];

class ExploreDestinationWidget extends StatefulWidget {
  const ExploreDestinationWidget({
    super.key,
    required this.itemWidth,
    required this.itemHeight,
  });

  final double itemWidth;
  final double itemHeight;

  @override
  State<ExploreDestinationWidget> createState() =>
      _ExploreDestinationWidgetState();
}

class _ExploreDestinationWidgetState extends State<ExploreDestinationWidget> {
  // List to hold the scale for each image container
  List<double> _scales = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      BlocProvider.of<GetLocationDetailsBloc>(context)
          .add(GetLocationDetailsEvent.getLocation());
    });
    _scales = List.generate(exploreDestination.length, (index) => 1.0);
  }

  void onTapDown(int index, TapDownDetails details) {
    setState(() {
      _scales[index] = 0.94;
    });
  }

  void onTapUp(int index, TapUpDetails details) {
    setState(() {
      _scales[index] = 1.0;
    });
  }

  void onTapCancel(int index) {
    setState(() {
      _scales[index] = 1.0;
    });
  }

  // Handle the tap without parameters for `onTap`
  void handleTap(int index) {
    onTapDown(index, TapDownDetails()); // Handle tap down with no details
    // You can reset the scale after a delay if needed
    Future.delayed(const Duration(milliseconds: 150), () {
      setState(() {
        _scales[index] = 1.0; // Reset the scale after the animation duration
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetLocationDetailsBloc, GetLocationDetailsState>(
      builder: (context, state) {
        return state.map(
          initial: (value) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.wifi_off,
                    size: 80,
                    color: Colors.redAccent,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "No internet",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Please check your internet settings and try again.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Add your retry logic here
                    },
                    child: Text("Retry"),
                  ),
                ],
              ),
            );
          },
          loading: (value) {
            return GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 2,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: widget.itemWidth / widget.itemHeight,
              ),
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: widget.itemWidth,
                    height: widget.itemHeight,
                  ),
                );
              },
            );
          },
          getLocationDetails: (value) {
            return GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: value.locationmodel.data?.length,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: widget.itemWidth / widget.itemHeight,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTapDown: (details) => onTapDown(index, details),
                  onTapUp: (details) {
                    onTapUp(index, details); // Reset the scale
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return LocationsBasedCruiseScreen(
                          location:
                              value.locationmodel.data![index].name.toString(),
                          pacakgeId:
                              value.locationmodel.data?[index].id.toString() ??
                                  "51",
                        );
                      },
                    ));
                  },
                  onTapCancel: () => onTapCancel(index),
                  child: AnimatedScale(
                    scale: _scales[index],
                    duration: const Duration(milliseconds: 150),
                    curve: Curves.easeInOut,
                    child: Stack(
                      children: [
                     ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        value.locationmodel.data?[index].thumbnail ?? '',
                        fit: BoxFit.cover,
                        width: widget.itemWidth,
                        height: widget.itemHeight,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            width: widget.itemWidth,
                            height: widget.itemHeight,
                            color: Colors.grey[300],
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(strokeWidth: 2),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: widget.itemWidth,
                            height: widget.itemHeight,
                            color: Colors.grey[300],
                            alignment: Alignment.center,
                            child:  Icon(Icons.image_not_supported, color: Colors.grey[700]),
                          );
                        },
                      ),
                    ),    Positioned(
                          bottom: 10,
                          left: 0,
                          right: 0,
                          child: Text(
                            "${value.locationmodel.data?[index].name}",
                            style: TextStyles.ubuntu16whiteE2w2500,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          getlocationsFailure: (value) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 80,
                    color: Colors.redAccent,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Something Went Wrong!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "We encountered an error while loading the data.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Error: ${value.error}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.redAccent,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add your retry logic here
                    },
                    icon: Icon(Icons.refresh),
                    label: Text("Retry"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                ],
              ),
            );
          },
          noInternet: (value) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.wifi_off,
                    size: 80,
                    color: Colors.redAccent,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "No internet",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Please check your internet settings and try again.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Add your retry logic here
                    },
                    child: Text("Retry"),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class ExploreDestinationmodel {
  final String image;
  final String place;

  const ExploreDestinationmodel({
    required this.image,
    required this.place,
  });
}
