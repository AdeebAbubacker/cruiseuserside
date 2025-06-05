import 'package:cruise_buddy/UI/Screens/guest/guest_home.dart';
import 'package:flutter/material.dart';
import 'package:in_app_update/in_app_update.dart';

class GuestUi extends StatefulWidget {
  const GuestUi({super.key});

  @override
  State<GuestUi> createState() => GuestUiState();
}

class GuestUiState extends State<GuestUi> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      checkForUpdate();
    });

    super.initState();
  }

  Future<void> checkForUpdate() async {
    try {
      final updateInfo = await InAppUpdate.checkForUpdate();

      if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
        InAppUpdate.performImmediateUpdate().catchError((e) {});
      }
    } catch (e) {}
  }

  // Future<void> _refresh() async {
  //     WidgetsBinding.instance.addPostFrameCallback((_) async {
  //       BlocProvider.of<GetUserProfileBloc>(context)
  //           .add(GetUserProfileEvent.getUserProfile());
  //       BlocProvider.of<GetFeaturedBoatsBloc>(context)
  //           .add(GetFeaturedBoatsEvent.getFeaturedBoats());
  //       BlocProvider.of<GetCruiseTypesBloc>(context)
  //           .add(GetCruiseTypesEvent.getCruiseTypes());
  //       BlocProvider.of<GetLocationDetailsBloc>(context)
  //           .add(GetLocationDetailsEvent.getLocation());
  //     });
  //   }

  //     WidgetsBinding.instance.addPostFrameCallback((_) async {
  //       BlocProvider.of<GetFavouritesListBloc>(context)
  //           .add(GetFavouritesListEvent.getFavouriteboats());
  //     });

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: GuestHome(
          changetab: () {},
        ));
  }
}
