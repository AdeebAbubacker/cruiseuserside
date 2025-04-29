import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:cruise_buddy/core/view_model/seeAllMyBookings/see_allmy_bookings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

class BoatsScreen extends StatefulWidget {
  const BoatsScreen({super.key});

  @override
  State<BoatsScreen> createState() => _BoatsScreenState();
}

class _BoatsScreenState extends State<BoatsScreen> {
  GlobalKey qrKey = GlobalKey();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      BlocProvider.of<SeeAllmyBookingsBloc>(context)
          .add(SeeAllmyBookingsEvent.seeMyBooking());
    });

    super.initState();
  }

  Future<void> _shareQr(GlobalKey key, String orderId) async {
    try {
      // Check if the key's context is available
      if (key.currentContext != null) {
        RenderRepaintBoundary boundary =
            key.currentContext!.findRenderObject() as RenderRepaintBoundary;
        var image = await boundary.toImage(pixelRatio: 3.0);
        ByteData? byteData =
            await image.toByteData(format: ImageByteFormat.png);
        Uint8List pngBytes = byteData!.buffer.asUint8List();

        // Save the image to a temporary directory
        final directory = await getTemporaryDirectory();
        final imagePath = await File('${directory.path}/qr_code.png').create();
        await imagePath.writeAsBytes(pngBytes);

        // Share the image file
        await Share.shareXFiles([XFile(imagePath.path)],
            text: 'Here is your ticket: $orderId');
      } else {
        print('QR code widget context is not available.');
      }
    } catch (e) {
      print('Error sharing QR: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeeAllmyBookingsBloc, SeeAllmyBookingsState>(
      builder: (context, state) {
        return state.map(
          initial: (value) {
            return Center(child: CircularProgressIndicator());
          },
          loading: (value) {
            return Center(child: CircularProgressIndicator());
          },
          getuseruccess: (value) {
            return ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: value.mybookingmodel.data?.length,
              itemBuilder: (context, index) {
                final booking = value?.mybookingmodel.data?[index];
                final imageUrl = (booking?.package?.cruise?.images != null &&
                        booking!.package!.cruise!.images!.isNotEmpty)
                    ? booking!.package!.cruise!.images![0].cruiseImg ??
                        'https://via.placeholder.com/100'
                    : 'https://via.placeholder.com/100';
                GlobalKey qrKey = GlobalKey();
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                imageUrl,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(Icons.image_not_supported),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    booking?.package?.cruise?.name ?? "N/A",
                                  ),
                                  const SizedBox(height: 8),
                                  Text("Paid Price: ₹${booking?.amountPaid}"),
                                  Text(
                                      "Amount to Pay: ₹${booking?.balanceAmount}"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // QR Code
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: RepaintBoundary(
                                key: qrKey, // Attach the GlobalKey here
                                child: QrImageView(
                                  data: booking?.orderId.toString() ?? "N/A",
                                  version: QrVersions.auto,
                                  size: 100,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            ),

                            // WhatsApp Share Button
                            ElevatedButton.icon(
                              onPressed: () async {
                                if (qrKey.currentContext != null) {
                                  _shareQr(qrKey,
                                      booking?.orderId.toString() ?? "N/A");
                                } else {
                                  print(
                                      'QR code widget context is not available.');
                                }
                              },
                              icon: Icon(Icons.share),
                              label: Text("Share"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          getuserFailure: (value) {
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
                            textAlign: TextAlign.center,
                            style: TextStyles.ubuntu14black55w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
          noInternet: (value) {
            return Text("No Internet");
          },
        );
      },
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
