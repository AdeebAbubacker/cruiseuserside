import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/booking_selection_widget.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/counter_pill.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/cruise_selection_widget.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/passengers_pill.dart';
import 'package:cruise_buddy/UI/Screens/search%20Results/screen/search_results_screen.dart';
import 'package:cruise_buddy/UI/Widgets/dateSelection/multiple_date_selection.dart';
import 'package:cruise_buddy/UI/Widgets/dateSelection/single_date_selection.dart';
import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:flutter/material.dart';

class DetailsDelegate extends StatefulWidget {
  final String? location;
  const DetailsDelegate({
    super.key,
     this.location,
  });

  @override
  State<DetailsDelegate> createState() => _DetailsDelegateState();
}

class _DetailsDelegateState extends State<DetailsDelegate> {
  String selectedCruise = "Day Cruise";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFAFFFF),
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
              icon: Icon(Icons.arrow_back_ios_new_sharp),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Date",
                    style: TextStyles.ubuntu16black23w500,
                  ),
                  SizedBox(height: 10),
                  if (selectedCruise == "Day Cruise")
                    SingleBookingDateselection(),
                  if (selectedCruise == "Full Cruise")
                    MultiplebookingDateselection(),
                  SizedBox(height: 15),
                  Text(
                    "Type of cruise",
                    style: TextStyles.ubuntu16black23w500,
                  ),
                  SizedBox(height: 10),
                  CruiseSelectionWidget(
                    onCruiseSelected: (cruise) {
                      setState(() {
                        selectedCruise = cruise;
                      });
                    },
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Numbers of passengers",
                    style: TextStyles.ubuntu16black23w500,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      PassengersPill(
                        image: 'assets/icons/adult.svg',
                      ),
                      Spacer(),
                      PassengersPill(
                        image: 'assets/icons/kid.svg',
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Number of rooms",
                    style: TextStyles.ubuntu16black23w500,
                  ),
                  SizedBox(height: 10),
                  CounterPill(),
                  SizedBox(height: 15),
                  Text(
                    "Type of booking",
                    style: TextStyles.ubuntu16black23w500,
                  ),
                  SizedBox(height: 10),
                  BookingSelectionWidget(),
                  SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          Color(0XFF1F8386),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return SearchResultsScreen(
                              filterCriteria: 'closed',
                              location: widget.location,
                            );
                          },
                        ));
                      },
                      child: Text(
                        "Continue",
                        style: TextStyles.ubuntu16whiteFFw500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
