import 'package:cruise_buddy/core/services/user/user_service.dart';
import 'package:cruise_buddy/core/view_model/bookMyCruise/book_my_cruise_bloc.dart';
import 'package:cruise_buddy/core/view_model/getUserProfile/get_user_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiTest extends StatelessWidget {
  const ApiTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BlocBuilder<GetUserProfileBloc, GetUserProfileState>(
              builder: (context, state) {
                return state.map(
                  initial: (value) {
                    return Text("ffffffffffffffff");
                  },
                  loading: (value) {
                    return Text("hhhhhhhhhhhhhhhhhhhhhhh");
                  },
                  getuseruccess: (value) {
                    return Text(
                        "ttttttttttttttttttttt ${value.userprofilemodel.data?.name ?? "d"}");
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
                await UserService().updateUserProfile(
                  name: 'name',
                  email: 'peter@gmail.com',
                  phone: '+919834567826',
                );
              },
              child: Text("data"),
            ),
          ],
        ),
      ),
    );
  }
}
