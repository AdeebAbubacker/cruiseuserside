import 'package:cruise_buddy/core/view_model/bookMyCruise/book_my_cruise_bloc.dart';
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
            BlocBuilder<BookMyCruiseBloc, BookMyCruiseState>(
              builder: (context, state) {
                return state.map(
                  initial: (value) {
                    return Text("ffffffffffffffff");
                  },
                  loading: (value) {
                    return Text("hhhhhhhhhhhhhhhhhhhhhhh");
                  },
                  getBookedBoats: (value) {
                    return Text("ttttttttttttttttttttt");
                  },
                  getBookedFailure: (value) {
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
              onPressed: () {
                BlocProvider.of<BookMyCruiseBloc>(context).add(
                    BookMyCruiseEvent.createNewbookings(
                        date: 'd', packageId: '51'));
              },
              child: Text("data"),
            ),
          ],
        ),
      ),
    );
  }
}
