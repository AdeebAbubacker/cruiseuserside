import 'package:cruise_buddy/UI/Screens/layout/main_layout/main_layout.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/categories_section.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/explore_destination.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/location_search_delgate.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/boats/widgets/featured_boats_container.dart';
import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:cruise_buddy/core/view_model/getUserProfile/get_user_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback changetab;
  const HomeScreen({
    super.key,
    required this.changetab,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
  
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      BlocProvider.of<GetUserProfileBloc>(context)
          .add(GetUserProfileEvent.getUserProfile());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String truncateString(String? value, int maxLength) {
      if (value == null) {
        return '';
      }
      return value.length > maxLength ? value.substring(0, maxLength) : value;
    }

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 230,
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          'assets/home/promotionalBanner.svg',
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          left: 20,
                          top: 40,
                          child: SizedBox(
                            width: 220,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Hi",
                                      style: TextStyles.ubuntu32black15w700,
                                    ),
                                    SizedBox(width: 5),
                                    BlocBuilder<GetUserProfileBloc,
                                        GetUserProfileState>(
                                      builder: (context, state) {
                                        return state.map(
                                          initial: (value) {
                                            return SizedBox.shrink();
                                          },
                                          loading: (value) {
                                            return Shimmer.fromColors(
                                              baseColor: Colors.grey[300]!,
                                              highlightColor: Colors.grey[100]!,
                                              child: Text(
                                                "Loading...",
                                                style: TextStyles
                                                    .ubuntu32blue86w700,
                                              ),
                                            );
                                          },
                                          getuseruccess: (value) {
                                            return Text(
                                              truncateString(
                                                  value.userprofilemodel.data
                                                      ?.name,
                                                  11),
                                              style:
                                                  TextStyles.ubuntu32blue86w700,
                                            );
                                          },
                                          getuserFailure: (value) {
                                            return Text(
                                              "User",
                                              style:
                                                  TextStyles.ubuntu32blue86w700,
                                            );
                                          },
                                          noInternet: (value) {
                                            return SizedBox.shrink();
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                Text(
                                  "Book your perfect boat adventure in just a few taps!",
                                  style: TextStyles.ubuntu14black55w400,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 20,
                    right: 20,
                    top: 180,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double containerWidth = constraints.maxWidth - 40;
                        return GestureDetector(
                          onTap: () async {
                            openLocationSearchDelegate(context);
                          },
                          child: Container(
                            width: containerWidth,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 0.4,
                                  blurRadius: 4,
                                  offset: Offset(0, 0),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                SvgPicture.asset('assets/icons/search.svg'),
                                SizedBox(width: 5),
                                Text(
                                  "Where dou you want to go?",
                                  style: TextStyles.ubuntu14black55w400,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
              ),
              child: Text(
                "Featured Boats",
                style: TextStyles.ubuntu20black15w700,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FeaturedBoatsSection(
              onChangeTab: widget.changetab,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
              ),
              child: Text(
                "Categories",
                style: TextStyles.ubuntu20black15w700,
              ),
            ),
            SizedBox(height: 20),
            CategoriesSection(),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
              ),
              child: Text(
                "Explore Destination",
                style: TextStyles.ubuntu20black15w700,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double gridWidth = constraints.maxWidth;
                  double itemWidth = (gridWidth - 15) / 2;
                  double itemHeight = itemWidth * 1.1;

                  return ExploreDestinationWidget(
                    itemWidth: itemWidth,
                    itemHeight: itemHeight,
                  );
                },
              ),
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  void openLocationSearchDelegate(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: const LocationSearchDelegate(),
          );
        },
        transitionDuration: const Duration(milliseconds: 500),
        reverseTransitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }
}
