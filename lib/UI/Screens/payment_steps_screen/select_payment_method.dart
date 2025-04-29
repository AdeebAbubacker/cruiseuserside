// import 'package:cruise_buddy/UI/Screens/payment_steps_screen/payment_confirmation.dart';
// import 'package:cruise_buddy/UI/Widgets/Button/fullwidth_rectangle_bluebutton.dart';
// import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class PaymentScreen extends StatefulWidget {
//   const PaymentScreen({super.key});

//   @override
//   State<PaymentScreen> createState() => _PaymentScreenState();
// }

// String? _selectedValue;

// class _PaymentScreenState extends State<PaymentScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 20, right: 20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                   child: SvgPicture.asset(
//                       'assets/image/payment_screen/Billing.svg')),
//               SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 "Credit or Debit Card",
//                 style: TextStyles.ubuntu20black15w600,
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Color(0xffE2E2E2),
//                     width: 1.0,
//                   ),
//                   borderRadius: BorderRadius.circular(15.0),
//                 ),
//                 child: ListTile(
//                   leading: Container(
//                       height: 35,
//                       width: 35,
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Color(0xffE2E2E2),
//                           width: 1.0,
//                         ),
//                         borderRadius: BorderRadius.circular(5.0),
//                       ),
//                       child: Icon(Icons.add, color: Color(0xff1F8386))),
//                   title: Text(
//                     'Add Your Card',
//                     style: TextStyles.ubuntu16black23w700,
//                   ),
//                   trailing: Radio(
//                       value: 'addCard',
//                       groupValue: _selectedValue,
//                       onChanged: (value) {
//                         setState(() {
//                           _selectedValue = value;
//                         });
//                       }),
//                 ),
//               ),
//               SizedBox(
//                 height: 25,
//               ),
//               Text(
//                 "UPI Payment",
//                 style: TextStyles.ubuntu20black15w600,
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Color(0xffE2E2E2),
//                     width: 1.0,
//                   ),
//                   borderRadius: BorderRadius.circular(15.0),
//                 ),
//                 child: Column(
//                   children: [
//                     ListTile(
//                       leading: Container(
//                           height: 35,
//                           width: 35,
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               color: Color(0xffE2E2E2),
//                               width: 1.0,
//                             ),
//                             borderRadius: BorderRadius.circular(5.0),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(4.0),
//                             child: Image.asset(
//                                 'assets/image/payment_screen/gpay.png'),
//                           )),
//                       title: Text(
//                         'Google Pay',
//                         style: TextStyles.ubuntu16black23w700,
//                       ),
//                       trailing: Radio(
//                           value: 'googlepay',
//                           groupValue: _selectedValue,
//                           onChanged: (value) {
//                             setState(() {
//                               _selectedValue = value;
//                             });
//                           }),
//                     ),
//                     ListTile(
//                       leading: Container(
//                           height: 35,
//                           width: 35,
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               color: Color(0xffE2E2E2),
//                               width: 1.0,
//                             ),
//                             borderRadius: BorderRadius.circular(5.0),
//                           ),
//                           child: SvgPicture.asset(
//                               'assets/image/payment_screen/razorpay.svg')),
//                       title: Text(
//                         'Razor Pay',
//                         style: TextStyles.ubuntu16black23w700,
//                       ),
//                       trailing: Radio(
//                           value: 'razorpay',
//                           groupValue: _selectedValue,
//                           onChanged: (value) {
//                             setState(() {
//                               _selectedValue = value;
//                             });
//                           }),
//                     ),
//                     ListTile(
//                       leading: Container(
//                           height: 35,
//                           width: 35,
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               color: Color(0xffE2E2E2),
//                               width: 1.0,
//                             ),
//                             borderRadius: BorderRadius.circular(5.0),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(4.0),
//                             child: SvgPicture.asset(
//                                 'assets/image/payment_screen/paytm.svg'),
//                           )),
//                       title: Text(
//                         'Paytm',
//                         style: TextStyles.ubuntu16black23w700,
//                       ),
//                       trailing: Radio(
//                           value: 'paytm',
//                           groupValue: _selectedValue,
//                           onChanged: (value) {
//                             setState(() {
//                               _selectedValue = value;
//                             });
//                           }),
//                     ),
//                     ListTile(
//                       leading: Container(
//                           height: 35,
//                           width: 35,
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               color: Color(0xffE2E2E2),
//                               width: 1.0,
//                             ),
//                             borderRadius: BorderRadius.circular(5.0),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(4.0),
//                             child: SvgPicture.asset(
//                                 'assets/image/payment_screen/phonepay.svg'),
//                           )),
//                       title: Text(
//                         'Phone Pay',
//                         style: TextStyles.ubuntu16black23w700,
//                       ),
//                       trailing: Radio(
//                           value: 'phonepay',
//                           groupValue: _selectedValue,
//                           onChanged: (value) {
//                             setState(() {
//                               _selectedValue = value;
//                             });
//                           }),
//                     ),
//                     ListTile(
//                       leading: Container(
//                           height: 35,
//                           width: 35,
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               color: Color(0xffE2E2E2),
//                               width: 1.0,
//                             ),
//                             borderRadius: BorderRadius.circular(5.0),
//                           ),
//                           child: Icon(Icons.add, color: Color(0xff1F8386))),
//                       title: Text(
//                         'Add New UPI ID',
//                         style: TextStyles.ubuntu16black23w700,
//                       ),
//                       trailing: Radio(
//                           value: 'newupiid',
//                           groupValue: _selectedValue,
//                           onChanged: (value) {
//                             setState(() {
//                               _selectedValue = value;
//                             });
//                           }),
//                     ),
//                     Text(
//                       'You need to have a registered UPI ID',
//                       style: TextStyles.ubuntu12blue23w700,
//                     ),
//                     SizedBox(
//                       height: 15,
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 25,
//               ),
//               Text(
//                 "More Payment Options",
//                 style: TextStyles.ubuntu20black15w600,
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Color(0xffE2E2E2),
//                     width: 1.0,
//                   ),
//                   borderRadius: BorderRadius.circular(15.0),
//                 ),
//                 child: Column(
//                   children: [
//                     ListTile(
//                       leading: Container(
//                           height: 35,
//                           width: 35,
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               color: Color(0xffE2E2E2),
//                               width: 1.0,
//                             ),
//                             borderRadius: BorderRadius.circular(5.0),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(4.0),
//                             child: SvgPicture.asset(
//                                 'assets/image/payment_screen/wallet.svg'),
//                           )),
//                       title: Text(
//                         'Wallet',
//                         style: TextStyles.ubuntu16black23w700,
//                       ),
//                       onTap: () {},
//                     ),
//                     ListTile(
//                       leading: Container(
//                           height: 35,
//                           width: 35,
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               color: Color(0xffE2E2E2),
//                               width: 1.0,
//                             ),
//                             borderRadius: BorderRadius.circular(5.0),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(4.0),
//                             child: SvgPicture.asset(
//                                 'assets/image/payment_screen/netbanking.svg'),
//                           )),
//                       title: Text(
//                         'Net Banking',
//                         style: TextStyles.ubuntu16black23w700,
//                       ),
//                       onTap: () {},
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 25,
//               ),
//               FullWidthRectangleBlueButton(
//                   text: 'Pay',
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => PaymentConfirmationSCreen()));
//                   }),
//               SizedBox(
//                 height: 25,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
