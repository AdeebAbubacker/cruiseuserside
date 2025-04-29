import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/booking_selection_widget.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/counter_pill.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/cruise_selection_widget.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/passengers_pill.dart';
import 'package:cruise_buddy/UI/Screens/search%20Results/screen/search_results_screen.dart';
import 'package:cruise_buddy/UI/Widgets/dateSelection/multiple_date_selection.dart';
import 'package:cruise_buddy/UI/Widgets/dateSelection/single_date_selection.dart';
import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:flutter/material.dart';

// class DetailsDelegate extends StatefulWidget {
//   final String? location;
//   const DetailsDelegate({
//     super.key,
//      this.location,
//   });

//   @override
//   State<DetailsDelegate> createState() => _DetailsDelegateState();
// }

// class _DetailsDelegateState extends State<DetailsDelegate> {
//   String selectedCruise = "Day Cruise";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0XFFFAFFFF),
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 10),
//             IconButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               icon: Icon(Icons.arrow_back_ios_new_sharp),
//             ),
//             const SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 16,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Date",
//                     style: TextStyles.ubuntu16black23w500,
//                   ),
//                   SizedBox(height: 10),
//                   if (selectedCruise == "Day Cruise")
//                     SingleBookingDateselection(),
//                   if (selectedCruise == "Full Cruise")
//                     MultiplebookingDateselection(),
//                   SizedBox(height: 15),
//                   Text(
//                     "Type of cruise",
//                     style: TextStyles.ubuntu16black23w500,
//                   ),
//                   SizedBox(height: 10),
//                   CruiseSelectionWidget(
//                     onCruiseSelected: (cruise) {
//                       setState(() {
//                         selectedCruise = cruise;
//                       });
//                     },
//                   ),
//                   SizedBox(height: 15),
//                   Text(
//                     "Numbers of passengers",
//                     style: TextStyles.ubuntu16black23w500,
//                   ),
//                   SizedBox(height: 10),
//                   Row(
//                     children: [
//                       PassengersPill(
//                         image: 'assets/icons/adult.svg',
//                       ),
//                       Spacer(),
//                       PassengersPill(
//                         image: 'assets/icons/kid.svg',
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 15),
//                   Text(
//                     "Number of rooms",
//                     style: TextStyles.ubuntu16black23w500,
//                   ),
//                   SizedBox(height: 10),
//                   CounterPill(),
//                   SizedBox(height: 15),
//                   Text(
//                     "Type of booking",
//                     style: TextStyles.ubuntu16black23w500,
//                   ),
//                   SizedBox(height: 10),
//                   BookingSelectionWidget(),
//                   SizedBox(height: 30),
//                   SizedBox(
//                     width: double.infinity,
//                     height: 45,
//                     child: ElevatedButton(
//                       style: ButtonStyle(
//                         backgroundColor: WidgetStateProperty.all(
//                           Color(0XFF1F8386),
//                         ),
//                       ),
//                       onPressed: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) {
//                             return SearchResultsScreen(
//                               filterCriteria: 'closed',
//                               location: widget.location,
//                             );
//                           },
//                         ));
//                       },
//                       child: Text(
//                         "Continue",
//                         style: TextStyles.ubuntu16whiteFFw500,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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

  // State variables for form values
  String? startDate;
  String? endDate;
  String? typeOfCruise;
  String? noOfAdults = '0';
  String? noOfKids = '0';
  String? noOfRooms = '0';
  String? bookingType;
  String? minAmount;
  String? maxAmount;
  String _formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
  }

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
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Date", style: TextStyles.ubuntu16black23w500),
                  SizedBox(height: 10),
                  if (selectedCruise == "Day Cruise")
                    SingleBookingDateselection(
                      onDateSelected: (date) {
                        setState(() {
                          startDate = date;
                          endDate = null;
                        });
                      },
                    ),
                  if (selectedCruise == "Full Cruise")
                    MultiplebookingDateselection(
                      onDateRangeSelected: (start, end) {
                        setState(() {
                          startDate = start != null ? _formatDate(start) : null;
                          endDate = end != null ? _formatDate(end) : null;
                        });
                      },
                    ),
                  SizedBox(height: 15),
                  Text("Type of cruise", style: TextStyles.ubuntu16black23w500),
                  SizedBox(height: 10),
                  CruiseSelectionWidget(
                    onCruiseSelected: (cruise) {
                      setState(() {
                        selectedCruise = cruise;
                        typeOfCruise = cruise;
                      });
                    },
                  ),
                  SizedBox(height: 15),
                  Text("Number of passengers",
                      style: TextStyles.ubuntu16black23w500),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      PassengersPill(
                        image: 'assets/icons/adult.svg',
                        onChanged: (count) {
                          setState(() {
                            noOfAdults = count.toString();
                          });
                        },
                      ),
                      Spacer(),
                      PassengersPill(
                        image: 'assets/icons/kid.svg',
                        onChanged: (count) {
                          setState(() {
                            noOfKids = count.toString();
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text("Number of rooms",
                      style: TextStyles.ubuntu16black23w500),
                  SizedBox(height: 10),
                  CounterPill(
                    onRoomCountChanged: (count) {
                      setState(() {
                        noOfRooms = count.toString();
                      });
                    },
                  ),
                  SizedBox(height: 15),
                  Text("Type of booking",
                      style: TextStyles.ubuntu16black23w500),
                  SizedBox(height: 10),
                  BookingSelectionWidget(
                    onBookingTypeSelected: (type) {
                      setState(() {
                        bookingType = type;
                      });
                    },
                  ),
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
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return SearchResultsScreen(
                                filterCriteria: bookingType,
                                location: widget.location,
                                startDate: startDate,
                                endDate: endDate,
                                typeOfCruise: typeOfCruise,
                                noOfPassengers: (int.parse(noOfAdults ?? '0') +
                                        int.parse(noOfKids ?? '0'))
                                    .toString(),
                                noOfRooms: noOfRooms,
                                premiumOrDeluxe: selectedCruise,
                                minAMount: minAmount,
                                maxAmount: maxAmount,
                              );
                            },
                          ),
                        );
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
