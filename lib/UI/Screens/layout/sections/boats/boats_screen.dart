import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BoatsScreen extends StatelessWidget {
  const BoatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: -40,
          child: SvgPicture.asset(
            'assets/icons/cruise_background.svg',
            color: const Color.fromARGB(255, 196, 238, 237),
          ),
        ),
        Positioned(
          bottom: 140,
          child: SvgPicture.asset(
            'assets/icons/cruise_background.svg',
            color: const Color.fromARGB(255, 181, 235, 233),
          ),
        ),
        Positioned(
          bottom: 150,
          child: SvgPicture.asset(
            'assets/icons/cruise_background.svg',
            color: const Color.fromARGB(255, 181, 235, 233),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/not_available_404.svg'),
                Text(
                  "No Booking Yet",
                  style: TextStyles.ubuntu18bluew700,
                ),
                Center(
                  child: Text(
                    "It looks like no bookings yet.",
                    textAlign:
                        TextAlign.center, 
                    style: TextStyles
                        .ubuntu14black55w400, 
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// import 'package:cruise_buddy/UI/Screens/layout/sections/boats/widgets/featured_boats_container.dart';
// import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class BoatsScreen extends StatefulWidget {
//   const BoatsScreen({super.key});

//   @override
//   State<BoatsScreen> createState() => _BoatsScreenState();
// }

// class _BoatsScreenState extends State<BoatsScreen> {
//   List<bool> isBookingList = [];
//   List<double> _scales = [];

//   @override
//   void initState() {
//     super.initState();
//     int itemCount = 10;
//     isBookingList = List.generate(itemCount, (index) => true);
//     _scales = List.generate(itemCount, (index) => 1.0);
//   }

//   void _onTapDown(int index) {
//     setState(() {
//       _scales[index] = 0.94;
//     });
//   }

//   void _onTapUp(int index) {
//     setState(() {
//       _scales[index] = 1.0;
//     });
//   }

//   Widget _buildUpcomingBookingCard(int index, double width) {
//     return GestureDetector(
//       onTapDown: (_) => _onTapDown(index),
//       onTapUp: (_) => _onTapUp(index),
//       onTapCancel: () => _onTapUp(index),
//       child: AnimatedScale(
//         scale: _scales[index],
//         duration: const Duration(milliseconds: 150),
//         curve: Curves.easeInOut,
//         child: SizedBox(
//           width: width * 0.6,
//           height: width * 0.6 * 1.4,
//           child: Card(
//             color: const Color(0XFFFFFFFF),
//             margin: const EdgeInsets.only(right: 12),
//             elevation: 1,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(13),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Stack(
//                   children: [
//                     ClipRRect(
//                       borderRadius: const BorderRadius.only(
//                         topLeft: Radius.circular(13),
//                         topRight: Radius.circular(13),
//                       ),
//                       child: Image.asset(
//                         "assets/image/fav_screen_img2.png",
//                         fit: BoxFit.cover,
//                         width: double.infinity,
//                         height: width * 0.6 * 0.4,
//                       ),
//                     ),
//                     Positioned(
//                       top: 10,
//                       right: 10,
//                       child: Container(
//                         width: 30,
//                         height: 30,
//                         decoration: const BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.white,
//                         ),
//                         child: Center(
//                           child: Icon(
//                             Icons.favorite,
//                             color: const Color(0XFF1F8386),
//                             size: 24,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 10,
//                       right: 10,
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 8, vertical: 4),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(24),
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: const [
//                             Icon(
//                               Icons.star,
//                               color: Colors.amber,
//                               size: 16,
//                             ),
//                             Text("4.3"),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           PillWidget(
//                             image: 'assets/icons/wifi.svg',
//                             text: 'Wifi',
//                           ),
//                           const SizedBox(width: 5),
//                           PillWidget(
//                             image: 'assets/icons/heater.svg',
//                             text: 'Heater',
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       Text(
//                         "Kerala’s Heritage Haven – Traditional Kerala Décor",
//                         style: const TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.w500,
//                         ),
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       const SizedBox(height: 12),
//                       Row(
//                         children: [
//                           SvgPicture.asset(
//                               'assets/icons/location_icon (2).svg'),
//                           const SizedBox(width: 8),
//                           Text(
//                             'Kumarakom',
//                             style: TextStyles.ubuntu14black00w500,
//                           )
//                         ],
//                       ),
//                       const SizedBox(height: 15),
//                       Row(
//                         children: [
//                           ElevatedButton(
//                             onPressed: () {},
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: const Color(0XFFFFFFFF),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                                 side: const BorderSide(
//                                     color: Color(0XFF1F8386), width: 1),
//                               ),
//                               padding: const EdgeInsets.symmetric(
//                                 vertical: 12,
//                                 horizontal: 8,
//                               ),
//                             ),
//                             child: Text(
//                               "Cancel Booking",
//                               style: TextStyles.ubuntu12blue23w700,
//                             ),
//                           ),
//                           const SizedBox(width: 6),
//                           ElevatedButton(
//                             onPressed: () {},
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: const Color(0XFF1F8386),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 8,
//                                 vertical: 12,
//                               ),
//                             ),
//                             child: Text(
//                               "View Details",
//                               style: TextStyles.ubuntu12whiteFFw400,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildPastBookingCard(int index, double width) {
//     return GestureDetector(
//       onTapDown: (_) => _onTapDown(index),
//       onTapUp: (_) => _onTapUp(index),
//       onTapCancel: () => _onTapUp(index),
//       child: AnimatedScale(
//         scale: _scales[index],
//         duration: const Duration(milliseconds: 150),
//         curve: Curves.easeInOut,
//         child: SizedBox(
//           width: width * 0.6,
//           height: width * 0.6 * 1.4,
//           child: Card(
//             color: const Color(0XFFFFFFFF),
//             margin: const EdgeInsets.only(right: 12),
//             elevation: 1,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(13),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Stack(
//                   children: [
//                     ClipRRect(
//                       borderRadius: const BorderRadius.only(
//                         topLeft: Radius.circular(13),
//                         topRight: Radius.circular(13),
//                       ),
//                       child: Image.asset(
//                         "assets/image/fav_screen_img2.png",
//                         fit: BoxFit.cover,
//                         width: double.infinity,
//                         height: width * 0.6 * 0.4,
//                       ),
//                     ),
//                     Positioned(
//                       top: 10,
//                       right: 10,
//                       child: Container(
//                         width: 30,
//                         height: 30,
//                         decoration: const BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.white,
//                         ),
//                         child: Center(
//                           child: Icon(
//                             Icons.favorite,
//                             color: const Color(0XFF1F8386),
//                             size: 24,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 10,
//                       right: 10,
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 8, vertical: 4),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(24),
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: const [
//                             Icon(
//                               Icons.star,
//                               color: Colors.amber,
//                               size: 16,
//                             ),
//                             Text("4.3"),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           PillWidget(
//                             image: 'assets/icons/wifi.svg',
//                             text: 'Wifi',
//                           ),
//                           const SizedBox(width: 5),
//                           PillWidget(
//                             image: 'assets/icons/heater.svg',
//                             text: 'Heater',
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       Text(
//                         "Kerala’s Heritage Haven – Traditional Kerala Décor",
//                         style: const TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.w500,
//                         ),
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       const SizedBox(height: 12),
//                       Row(
//                         children: [
//                           SvgPicture.asset(
//                               'assets/icons/location_icon (2).svg'),
//                           const SizedBox(width: 8),
//                           Text(
//                             'Kumarakom',
//                             style: TextStyles.ubuntu14black00w500,
//                           )
//                         ],
//                       ),
//                       const SizedBox(height: 15),
//                       const SizedBox(width: 6),
//                       ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0XFF1F8386),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 10,
//                             vertical: 12,
//                           ),
//                         ),
//                         child: Text(
//                           "Write Review",
//                           style: TextStyles.ubuntu12whiteFFw400,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;

//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 14.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 15),
//             Text('Upcoming Bookings', style: TextStyles.ubuntu20black15w600),
//             const SizedBox(height: 7),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: List.generate(
//                   10,
//                   (index) => _buildUpcomingBookingCard(index, width),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 15),
//             Text('Past Bookings', style: TextStyles.ubuntu20black15w600),
//             const SizedBox(height: 7),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: List.generate(
//                   10,
//                   (index) => _buildPastBookingCard(index, width),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
