import 'package:cruise_buddy/UI/Screens/guest/guest_categories.dart';
import 'package:cruise_buddy/UI/Screens/guest/guest_explore_destintion.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/categories_section.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/explore_destination.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/location_search_delgate.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/boats/widgets/featured_boats_container.dart';
import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:cruise_buddy/core/db/hive_db/adapters/user_details_adapter.dart';
import 'package:cruise_buddy/core/db/hive_db/boxes/user_details_box.dart';
import 'package:cruise_buddy/core/view_model/getCruiseTypes/get_cruise_types_bloc.dart';
import 'package:cruise_buddy/core/view_model/getFeaturedBoats/get_featured_boats_bloc.dart';
import 'package:cruise_buddy/core/view_model/getLocationDetails/get_location_details_bloc.dart';
import 'package:cruise_buddy/core/view_model/getUserProfile/get_user_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shimmer/shimmer.dart';

class GuestHome extends StatefulWidget {
  final VoidCallback changetab;
  const GuestHome({
    super.key,
    required this.changetab,
  });

  @override
  State<GuestHome> createState() => _GuestHomeState();
}

class _GuestHomeState extends State<GuestHome> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      BlocProvider.of<GetUserProfileBloc>(context)
          .add(GetUserProfileEvent.getUserProfile());
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        BlocProvider.of<GetUserProfileBloc>(context)
            .add(GetUserProfileEvent.getUserProfile());
        BlocProvider.of<GetFeaturedBoatsBloc>(context)
            .add(GetFeaturedBoatsEvent.getFeaturedBoats());
        BlocProvider.of<GetCruiseTypesBloc>(context)
            .add(GetCruiseTypesEvent.getCruiseTypes());
        BlocProvider.of<GetLocationDetailsBloc>(context)
            .add(GetLocationDetailsEvent.getLocation());
      });
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
                                    ValueListenableBuilder(
                                      valueListenable:
                                          userDetailsBox.listenable(),
                                      builder: (context, Box box, _) {
                                        final userDetails =
                                            box.get('user') as UserDetailsDB?;

                                        if (userDetails == null) {
                                          return Text(
                                            "Guest",
                                            style:
                                                TextStyles.ubuntu32blue86w700,
                                          );
                                        }

                                        return Text(
                                          truncateString(
                                              userDetails.name?.toString(), 11),
                                          style: TextStyles.ubuntu32blue86w700,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                Text(
                                  "See your perfect boat adventure in just a few taps!",
                                  style: TextStyles.ubuntu14black55w400,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 10,
                          top: 5,
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                            ),
                          ),
                        ),
                      ],
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
                "Categories",
                style: TextStyles.ubuntu20black15w700,
              ),
            ),
            SizedBox(height: 20),
            GuestCategoriesSection(),
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

                  return GuestExploreDestintionWidget(
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
