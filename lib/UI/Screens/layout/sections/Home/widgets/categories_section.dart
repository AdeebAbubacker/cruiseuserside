import 'package:cruise_buddy/UI/Screens/misc/categories_list_resultscreen.dart';
import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:cruise_buddy/core/view_model/getCruiseTypes/get_cruise_types_bloc.dart';
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

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({
    super.key,
  });

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  List<double> _scales = [];

  @override
  void initState() {
    super.initState();

    _scales = List.generate(exploreDestination.length, (index) => 1.0);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      BlocProvider.of<GetCruiseTypesBloc>(context)
          .add(GetCruiseTypesEvent.getCruiseTypes());
    });
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

  void handleTap(int index) {
    onTapDown(index, TapDownDetails());

    Future.delayed(const Duration(milliseconds: 150), () {
      setState(() {
        _scales[index] = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCruiseTypesBloc, GetCruiseTypesState>(
      builder: (context, state) {
        return state.map(
          initial: (value) {
            return SizedBox(
              height: 210,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: exploreDestination.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 30 : 10,
                      right: index == exploreDestination.length - 1 ? 10 : 0,
                    ),
                    child: GestureDetector(
                      onTapDown: (details) => onTapDown(index, details),
                      onTapUp: (details) => onTapUp(index, details),
                      onTapCancel: () => onTapCancel(index),
                      onTap: () => handleTap(index),
                      child: AnimatedScale(
                        scale: _scales[index],
                        duration: const Duration(milliseconds: 150),
                        curve: Curves.easeInOut,
                        child: Shimmer.fromColors(
                          baseColor: const Color.fromARGB(255, 232, 232, 232),
                          highlightColor:
                              const Color.fromARGB(31, 233, 231, 231),
                          child: Container(
                            color: const Color.fromARGB(0, 224, 223, 223),
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/image/onboarding_img/onboarding_one.png',
                                    width: 200,
                                    height: 110,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "",
                                  style: TextStyles.ubuntu16blue86w500,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
          loading: (value) {
            return SizedBox(
              height: 210,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: exploreDestination.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 30 : 10,
                    ),
                    child: GestureDetector(
                      onTapDown: (details) => onTapDown(index, details),
                      onTapUp: (details) => onTapUp(index, details),
                      onTapCancel: () => onTapCancel(index),
                      onTap: () => handleTap(index),
                      child: AnimatedScale(
                        scale: _scales[index],
                        duration: const Duration(milliseconds: 150),
                        curve: Curves.easeInOut,
                        child: Shimmer.fromColors(
                          baseColor: const Color.fromARGB(255, 232, 232, 232),
                          highlightColor:
                              const Color.fromARGB(31, 233, 231, 231),
                          child: Container(
                            color: const Color.fromARGB(0, 224, 223, 223),
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/image/onboarding_img/onboarding_one.png',
                                    width: 200,
                                    height: 110,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "sss",
                                  style: TextStyles.ubuntu16blue86w500,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
          getCruiseTypes: (value) {
            var openCruiseTypes = value.cruisetypemodel.data
                ?.where((cruise) => cruise.type == "Open")
                .toList();
            return SizedBox(
              height: 210,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: openCruiseTypes?.length ?? 0,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 30 : 10,
                      right: (openCruiseTypes != null &&
                              index == openCruiseTypes.length - 1)
                          ? 20
                          : 0,
                    ),
                    child: GestureDetector(
                      onTapDown: (_) {
                        setState(() {
                          _scales[index] = 0.94;
                        });
                      },
                      onTapUp: (_) {
                        Future.delayed(const Duration(milliseconds: 150), () {
                          setState(() {
                            _scales[index] = 1.0;
                          });

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoriesListResultscreen(
                                category:
                                    '${openCruiseTypes?[index].type}',location: '',
                              ),
                            ),
                          );
                        });
                      },
                      onTapCancel: () {
                        setState(() {
                          _scales[index] = 1.0;
                        });
                      },
                      child: AnimatedScale(
                        scale: _scales[index],
                        duration: const Duration(milliseconds: 150),
                        curve: Curves.easeInOut,
                        child: Container(
                          color: const Color.fromARGB(0, 0, 0, 0),
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  "${openCruiseTypes?[index].image}",
                                  width: 200,
                                  height: 110,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "${openCruiseTypes?[index].modelName}",
                                style: TextStyles.ubuntu16blue86w500,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
          getCruiseTypesFailure: (value) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    color: Colors.redAccent,
                    size: 80,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Something went wrong!",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "We couldn't load the data.\nPlease try again later.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Retry logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Retry",
                      style: TextStyle(color: Colors.white),
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
                    color: Colors.grey[600],
                    size: 80,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "No Internet Connection",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Please check your connection and try again.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Retry logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Retry",
                      style: TextStyle(color: Colors.white),
                    ),
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
