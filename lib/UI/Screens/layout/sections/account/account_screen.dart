import 'dart:io';
import 'package:cruise_buddy/UI/Screens/Auth/login_screens.dart';
import 'package:cruise_buddy/UI/Screens/misc/privacy_policy.dart';
import 'package:cruise_buddy/core/services/auth/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isEditing = false;
  TextEditingController nameController =
      TextEditingController(text: 'Rohan Jacob');
  TextEditingController emailController =
      TextEditingController(text: 'rohanjacob123@gmail.com');
  TextEditingController phoneController =
      TextEditingController(text: '+91 9826 727 916');

  XFile? _pickedImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _pickedImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        Stack(
          alignment: Alignment.center,
          children: [
            if (!isEditing) ...[
              CustomPaint(
                size: const Size(120, 120),
                painter: DottedBorderPainter(),
              ),
            ],
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.transparent,
              backgroundImage: _pickedImage != null
                  ? FileImage(File(_pickedImage!.path))
                  : null,
              child: _pickedImage == null
                  ? ClipOval(
                      child: Image.asset(
                        'assets/image/profile/profile_img.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    )
                  : null,
            ),
            Positioned(
              bottom: 0,
              right: 5,
              child: GestureDetector(
                onTap: () {
                  if (isEditing) {
                    _pickImage();
                  } else {
                    setState(() {
                      isEditing = !isEditing;
                    });
                  }
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(4),
                  child: isEditing
                      ? SvgPicture.asset(
                          'assets/image/profile/profile_pic_edit.svg')
                      : SvgPicture.asset(
                          'assets/image/profile/profile_pic_edit.svg'),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        if (isEditing) ...[
          _buildEditableField(nameController),
          _buildEditableField(emailController),
          _buildEditableField(phoneController),
        ] else ...[
          Text(nameController.text,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(emailController.text,
              style: const TextStyle(fontSize: 14, color: Colors.black54)),
          const SizedBox(height: 5),
          Text(phoneController.text,
              style: const TextStyle(fontSize: 14, color: Colors.black54)),
        ],
        const SizedBox(height: 30),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              ListTile(
                leading: SvgPicture.asset(
                  'assets/image/profile/change_password.svg',
                ),
                title: const Text('Change Password'),
                trailing: SvgPicture.asset(
                  'assets/image/profile/arrow_right.svg',
                ),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                leading: SvgPicture.asset(
                  'assets/image/profile/privacy_policy.svg',
                ),
                title: const Text('Privacy Policy'),
                trailing: SvgPicture.asset(
                  'assets/image/profile/arrow_right.svg',
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PrivacyPolicyScreen();
                      },
                    ),
                  );
                },
              ),
              const Divider(),
              ListTile(
                leading: SvgPicture.asset(
                  'assets/image/profile/logout.svg',
                ),
                title: const Text(
                  'Logout',
                  style: TextStyle(color: Color(0xff1F8386)),
                ),
                trailing: SvgPicture.asset(
                  'assets/image/profile/arrow_right.svg',
                ),
                onTap: () async {
                  try {
                    // Get instance of SharedPreferences
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    // Check if Google Sign-In is used
                    GoogleSignIn googleSignIn = GoogleSignIn();
                    if (await googleSignIn.isSignedIn()) {
                      await googleSignIn.signOut();
                    }

                    // Logout from your authentication service
                    await AuthServices().logout();

                    // Remove access token from shared preferences
                    await prefs.remove('accessToken');

                    // Navigate to LoginScreen and remove previous routes
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      (route) => false,
                    );
                  } catch (e) {
                    print("Logout Error: $e"); // Handle errors gracefully
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEditableField(TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: TextField(
          controller: controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(
                color: Color(0xff555555),
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(
                color: Color(0xffE2E2E2),
                width: 1.0,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 15),
          ),
        ),
      ),
    );
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    showAlertDialog(
        context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );

    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class DottedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double radius = size.width / 2;

    final paint = Paint()
      ..color = Color(0XFF1F8386)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    double dashWidth = 30, dashSpace = 10;
    double circumference = 2 * 3.14159265359 * radius;
    double dashCount = circumference / (dashWidth + dashSpace);

    for (int i = 0; i < dashCount; i++) {
      double startAngle = (i * (dashWidth + dashSpace)) / radius;
      double endAngle = startAngle + dashWidth / radius;

      canvas.drawArc(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: radius,
        ),
        startAngle,
        endAngle - startAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
