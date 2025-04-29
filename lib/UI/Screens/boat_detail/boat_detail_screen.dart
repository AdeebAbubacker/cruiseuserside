import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/booking_selection_widget.dart';
import 'package:cruise_buddy/UI/Screens/payment_steps_screen/booking_confirmation_screen.dart';
import 'package:cruise_buddy/UI/Widgets/Button/fullwidth_rectangle_bluebutton.dart';
import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BoatDetailScreen extends StatefulWidget {
  final String packageId;
  const BoatDetailScreen({
    super.key,
    required this.packageId,
  });

  @override
  State<BoatDetailScreen> createState() => _BoatDetailScreenState();
}

class _BoatDetailScreenState extends State<BoatDetailScreen> {
  String selectedBookingType = "Day Cruise"; // Default booking type

  // Method to handle booking type selection
  void _onBookingTypeSelected(String bookingType) {
    setState(() {
      selectedBookingType = bookingType;
    });
  }

  final List<String> imageUrls = [
    'assets/image/boat_details_img/boat_detail_img.png',
    'assets/image/boat_details_img/boat_detail_img.png',
    'assets/image/boat_details_img/boat_detail_img.png',
    'assets/image/boat_details_img/boat_detail_img.png',
  ];
  int _currentIndex = 0;

  final List<Map<String, dynamic>> reviews = [
    {
      "name": "Samantha Payne",
      "username": "@Sam.Payne90",
      "profileImage": null,
      "rating": 4.0,
      "reviewText":
          "Good experience, but could be better. The boat ride was scenic, and we loved the views, but the facilities on board felt a bit outdated. The food was nice, though we expected a bit more variety. A few improvements could make this an amazing experience.",
      "date": "23 Nov 2021",
    },
  ];

  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: SvgPicture.asset(
                  'assets/image/boat_details_img/share_icon.svg'),
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              child: SvgPicture.asset(
                  'assets/image/boat_details_img/fav_icon.svg'),
              onTap: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    itemCount: imageUrls.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            imageUrls[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 20,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${_currentIndex + 1}/${imageUrls.length}',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '₹5000 / day',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Color(0xffE2E2E2))),
                        child: Row(
                          children: [
                            Icon(Icons.star, size: 16, color: Colors.amber),
                            SizedBox(width: 4),
                            Text(
                              '4.3',
                              style: TextStyle(color: Color(0xff555555)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Kerala’s Heritage Haven – Traditional Kerala Décor",
                          style: TextStyles.ubuntu16black15w500,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Type of Cruise',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  BookingSelectionWidget(
                    onBookingTypeSelected: _onBookingTypeSelected,
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      SvgPicture.asset(
                          'assets/image/boat_details_img/cruise_ship_logo.svg'),
                      SizedBox(width: 12),
                      Text(
                        'Cruise Ship',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      SvgPicture.asset(
                          'assets/image/boat_details_img/msg_icon.svg'),
                      SizedBox(width: 9),
                      SvgPicture.asset(
                          'assets/image/boat_details_img/call_icon.svg'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Description',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Set off on a luxurious voyage with Sea Breeze, a modern yacht designed for comfort and style. Equipped with spacious seating, shaded areas, and panoramic views, it’s perfect for relaxing or celebrating. Enjoy a smooth and stable ride, thanks to its advanced navigation and safety features. Onboard amenities include a kitchenette, sound system, and fresh water supply. Whether for a sunset cruise or a day-long adventure, Sea Breeze promises an unforgettable experience on the water.',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 15),
                  _buildInfoRow(
                      Icons.people, "Passenger Capacity", "08-10 Adults"),
                  SizedBox(height: 10),
                  _buildInfoRow(
                      Icons.access_time, "Boat Timing", "09:00 PM - 06:00 AM"),
                  const SizedBox(height: 16.0),
                  Text(
                    "Location",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Expanded(
                          child: Text('Kavanattinkara,\nKumarakom, Kerala ')),
                      Expanded(
                        child: Container(
                          height: 141,
                          width: 92,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.grey.shade200,
                          ),
                          child: Center(
                            child:
                                Icon(Icons.map, size: 50, color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    "Amenities",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  GridView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2.5,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    children: [
                      _buildAmenityButton(Icons.hot_tub, "Water Heater"),
                      _buildAmenityButton(Icons.wifi, "Wi-Fi"),
                      _buildAmenityButton(Icons.videocam, "Projector"),
                      _buildAmenityButton(Icons.mic, "Mic"),
                      _buildAmenityButton(Icons.music_note, "Music System"),
                      _buildAmenityButton(Icons.tv, "TV"),
                      _buildAmenityButton(Icons.iron, "Iron Box"),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    "Reviews",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Column(
                    children: reviews
                        .map((review) => _buildReviewCard(review))
                        .toList(),
                  ),
                  if (reviews.length > 1)
                    Center(
                      child: TextButton.icon(
                        onPressed: () {
                          setState(() {
                            showMore = !showMore;
                          });
                        },
                        icon: Icon(
                          showMore
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                        ),
                        label: Text(showMore ? "Show less" : "+4 More reviews"),
                      ),
                    ),
                  SizedBox(
                    height: 17,
                  ),
                  FullWidthRectangleBlueButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookingconfirmationScreen(
                                    packageId: widget.packageId,
                                  )));
                    },
                    text: 'Book Now',
                  ),
                  SizedBox(
                    height: 17,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String subtitle) {
    return Row(
      children: [
        Icon(icon, color: Colors.black),
        const SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 16.0, color: Colors.grey)),
            Text(subtitle,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  Widget _buildAmenityButton(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xffE2E2E2)),
                borderRadius: BorderRadius.circular(28)),
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Icon(icon, color: Color(0xff555555)),
                const SizedBox(width: 10.0),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12.0),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewCard(Map<String, dynamic> review) {
    return Card(
      color: Color(0xffFFFFFF),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20.0,
                ),
                const SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review["name"],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      review["username"],
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8.0),

            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < review["rating"] ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 16.0,
                );
              }),
            ),
            const SizedBox(height: 8.0),

            // Review Text with "Show More/Less"
            Text(
              review["reviewText"],
              maxLines: showMore ? null : 3,
              overflow: showMore ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8.0),

            // Review Date
            Text(
              review["date"],
              style: TextStyle(fontSize: 12.0, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
//---------------git_test---------------
