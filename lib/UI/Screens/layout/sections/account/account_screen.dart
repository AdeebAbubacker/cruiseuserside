import 'dart:io';
import 'package:cruise_buddy/UI/Screens/Auth/login_screens.dart';
import 'package:cruise_buddy/UI/Screens/misc/privacy_policy.dart';
import 'package:cruise_buddy/UI/Screens/misc/terms_and_c_screen.dart';
import 'package:cruise_buddy/core/db/hive_db/adapters/user_details_adapter.dart';
import 'package:cruise_buddy/core/db/hive_db/boxes/user_details_box.dart';
import 'package:cruise_buddy/core/services/auth/auth_services.dart';
import 'package:cruise_buddy/core/view_model/updateUserProfile/update_user_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
  FocusNode nameFocusnode = FocusNode();
  FocusNode emailFocusnode = FocusNode();
  FocusNode phoneNoFocusnode = FocusNode();
  XFile? _pickedImage;
  String? imageUrl;
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    userDetailsBox = await Hive.openBox<UserDetailsDB>('userDetailsBox');
    final userDetails = userDetailsBox.get('user');

    if (userDetails != null) {
      setState(() {
        nameController = TextEditingController(text: userDetails.name);
        emailController = TextEditingController(text: userDetails.email);
        phoneController = TextEditingController(text: userDetails.phone);
        imageUrl = userDetails.image.isNotEmpty ? userDetails.image : null;
      });
    } else {
      setState(() {
        nameController = TextEditingController(text: '');
        emailController = TextEditingController(text: '');
        phoneController = TextEditingController(text: '');
        imageUrl = null;
      });
    }
  }

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
    return BlocListener<UpdateUserProfileBloc, UpdateUserProfileState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          loading: (_) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) =>
                  const Center(child: CircularProgressIndicator()),
            );
          },
          updateuser: (value) async {
            Navigator.of(context).pop(); // Close loading
            if (value.updateuser != null) {
              // Create UserDetailsDB from LoginModel's user
              final userDetails = UserDetailsDB(
                name: value.updateuser.user?.name ?? "",
                email: value.updateuser.user?.email ?? "",
                phone: value.updateuser.user?.phoneNumber ?? "",
                image: value.updateuser.user?.imagePath ?? "",
              );

              // Save it to Hive
              await userDetailsBox.put('user', userDetails);
            }
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Success'),
                content: const Text('Profile updated successfully!'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          },
          updateFailure: (error) {
            Navigator.of(context).pop(); // Close loading
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Error'),
                content: Text(error.error ?? 'Something went wrong!'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          },
          noInternet: (error) {
            Navigator.of(context).pop(); // Close loading
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Error'),
                content: Text('SNo Internet!'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            if (isEditing)
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300], // light grey background
                      shape: BoxShape.circle, // make it circular
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.check, color: Colors.green),
                      onPressed: () {
                        setState(() {
                          isEditing = false;
                          // Save changes logic here
                          BlocProvider.of<UpdateUserProfileBloc>(context).add(
                            UpdateUserProfileEvent.updateprofile(
                              name: nameController.text.trim(),
                              email: emailController.text.trim(),
                              phone: phoneController.text.trim(),
                              image: _pickedImage?.path ??
                                  '', // pass image path if selected
                            ),
                          );
                        });
                      },
                    ),
                  ),
                ),
              ),
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
                      ? FileImage(File(_pickedImage!.path)) // Local image
                      : imageUrl != null
                          ? NetworkImage(imageUrl!) // Network image
                          : null, // Default if no image
                  child: _pickedImage == null && imageUrl == null
                      ? ClipOval(
                          child: Icon(Icons.person),
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
              BuildEditableField(
                textEditingController: nameController,
                focusNode: nameFocusnode,
              ),
              BuildEditableField(
                textEditingController: emailController,
                focusNode: emailFocusnode,
              ),
              BuildEditableField(
                textEditingController: phoneController,
                focusNode: phoneNoFocusnode,
              ),
            ] else ...[
              Text(nameController.text,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
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
                  // ListTile(
                  //   leading: SvgPicture.asset(
                  //     'assets/image/profile/change_password.svg',
                  //   ),
                  //   title: const Text('Change Password'),
                  //   trailing: SvgPicture.asset(
                  //     'assets/image/profile/arrow_right.svg',
                  //   ),
                  //   onTap: () {},
                  // ),
                  // const Divider(),
                  ListTile(
                    leading: const Icon(Icons
                        .description), // or Icons.rule, Icons.article, Icons.gavel
                    title: const Text('T & C'),
                    trailing: SvgPicture.asset(
                      'assets/image/profile/arrow_right.svg',
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return TermsAndConditionsScreen();
                          },
                        ),
                      );
                    },
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
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
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

class BuildEditableField extends StatelessWidget {
  FocusNode focusNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();
  BuildEditableField({
    super.key,
    required this.textEditingController,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: TextField(
          focusNode: focusNode,
          controller: textEditingController,
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
}
