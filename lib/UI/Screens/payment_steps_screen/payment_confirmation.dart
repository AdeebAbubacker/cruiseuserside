import 'package:cruise_buddy/UI/Screens/layout/main_layout/main_layout.dart';
import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentConfirmationSCreen extends StatefulWidget {
  const PaymentConfirmationSCreen({super.key});

  @override
  State<PaymentConfirmationSCreen> createState() =>
      _PaymentConfirmationSCreenState();
}

class _PaymentConfirmationSCreenState extends State<PaymentConfirmationSCreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFD9D9D9),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MainLayout()),
                (route) => false, // This removes all previous routes
              );
            },
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SvgPicture.asset('assets/image/payment_screen/Payed.svg'),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Congradulations!",
                          style: TextStyles.ubuntu16blue86w600,
                        ),
                        Text(
                          "Booking confirmed",
                          style: TextStyles.ubuntu14black00w500,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 125, 211, 234),
                            borderRadius: BorderRadius.circular(33),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: const Color(0XFF1F8386),
                                        width: 2.0,
                                      ),
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/icons/clarity_boat.svg',
                                      width: 30.0,
                                      height: 30.0,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Kerala Heritage Haven",
                                        style: TextStyles.rubik16w2700,
                                      ),
                                      Text(
                                        "Premium",
                                        style: TextStyles.ubuntu12blue23w300,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Booking Id",
                                        style: TextStyles.ubuntu14black55w400,
                                      ),
                                      Text(
                                        "A098874",
                                        style: TextStyles.ubuntu14black00w600,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Check In",
                                        style: TextStyles.ubuntu14black55w400,
                                      ),
                                      Text("26 Nov, 2024"),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Passengers",
                                        style: TextStyles.ubuntu14black55w400,
                                      ),
                                      Text(
                                        "4",
                                        style: TextStyles.ubuntu14black00w600,
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Transaction Id",
                                        style: TextStyles.ubuntu14black55w400,
                                      ),
                                      Text(
                                        "A098874",
                                        style: TextStyles.ubuntu14black00w600,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Check Out",
                                        style: TextStyles.ubuntu14black55w400,
                                      ),
                                      Text(
                                        "27 Nov, 2024",
                                        style: TextStyles.ubuntu14black00w600,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Night",
                                        style: TextStyles.ubuntu14black55w400,
                                      ),
                                      Text(
                                        "2",
                                        style: TextStyles.ubuntu14black00w600,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 120),
                              SizedBox(
                                width: double.infinity,
                                height: 55,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStateProperty.all(
                                        Color(0xFF1F8386)),
                                    shape: WidgetStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "Download Ticket",
                                    style: TextStyles.ubuntu16whiteFFw500,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: -20,
                    bottom: 80,
                    child: ClipOval(
                      child: Container(
                        width: 40,
                        height: 40,
                        color: Color(0XFFD9D9D9),
                      ),
                    ),
                  ),
                  Positioned(
                    right: -20,
                    bottom: 80,
                    child: ClipOval(
                      child: Container(
                        width: 40,
                        height: 40,
                        color: Color(0XFFD9D9D9),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
