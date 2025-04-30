import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:cruise_buddy/core/db/hive_db/adapters/user_details_adapter.dart';
import 'package:cruise_buddy/core/db/hive_db/boxes/user_details_box.dart';
import 'package:cruise_buddy/core/services/user/user_service.dart';
import 'package:cruise_buddy/core/view_model/getUserProfile/get_user_profile_bloc.dart';
import 'package:cruise_buddy/core/view_model/updateUserProfile/update_user_profile_bloc.dart';
import 'package:cruise_buddy/core/view_model/viewMyPackage/view_my_package_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ApiTest extends StatelessWidget {
  const ApiTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BlocBuilder<ViewMyPackageBloc, ViewMyPackageState>(
              builder: (context, state) {
                return state.map(
                  initial: (value) {
                    return Text("ffffffffffffffff");
                  },
                  loading: (value) {
                    return Text("hhhhhhhhhhhhhhhhhhhhhhh");
                  },
                  viewMyPacakge: (value) {
                    return Text(
                        "ttttttttttttttttttttt ${value.mybookingmodel.data?.cruise?.name ?? "d"}");
                  },
                  getuserFailure: (value) {
                    return Text("cghfgjcgfj");
                  },
                  noInternet: (value) {
                    return Text("uuuuuuuuuuuuuuuuuu");
                  },
                );
              },
            ),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () async {
                BlocProvider.of<ViewMyPackageBloc>(context)
                    .add(ViewMyPackageEvent.viewMyPackage(packageId: '53'));
              },
              child: Text("data"),
            ),
          ],
        ),
      ),
    );
  }
}
