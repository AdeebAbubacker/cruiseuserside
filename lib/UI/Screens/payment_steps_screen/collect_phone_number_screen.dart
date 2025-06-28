import 'package:cruise_buddy/UI/Widgets/Button/fullwidth_rectangle_bluebutton.dart';
import 'package:cruise_buddy/UI/Widgets/toast/custom_toast.dart';
import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:cruise_buddy/core/db/hive_db/adapters/user_details_adapter.dart';
import 'package:cruise_buddy/core/view_model/updateUserProfile/update_user_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cruise_buddy/UI/Widgets/Button/fullwidth_rectangle_bluebutton.dart';
import 'package:cruise_buddy/UI/Widgets/toast/custom_toast.dart';
import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:cruise_buddy/core/db/hive_db/adapters/user_details_adapter.dart';
import 'package:cruise_buddy/core/view_model/updateUserProfile/update_user_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CollectPhoneNumberScreen extends StatefulWidget {
  const CollectPhoneNumberScreen({super.key});

  @override
  CollectPhoneNumberScreenState createState() =>
      CollectPhoneNumberScreenState();
}

class CollectPhoneNumberScreenState extends State<CollectPhoneNumberScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final FocusNode phoneFocusNode = FocusNode();
  bool isLoading = false;
  String? phoneErrorText;
  bool hasTriedSubmit = false;
  
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.removeListener(_validatePhone);
    _phoneController.dispose();
    phoneFocusNode.dispose();
    super.dispose();
  }

  void _startListening() {
    if (!hasTriedSubmit) {
      _phoneController.addListener(_validatePhone);
      hasTriedSubmit = true;
    }
  }

  void _validatePhone() {
    final phone = _phoneController.text.trim();
    String? newError;

    if (phone.isEmpty || phone.length != 10) {
      newError = 'Phone number must be exactly 10 digits';
    }

    if (newError != phoneErrorText) {
      setState(() {
        phoneErrorText = newError;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Enter Phone Number")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _phoneController,
              focusNode: phoneFocusNode,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              style: TextStyles.ubuntutextfieldText,
              decoration: InputDecoration(
                hintText: "Enter your phone number",
                hintStyle: TextStyles.ubuntuhintText,
                errorText: phoneErrorText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    'assets/image/auth_img/ion_mail-outline.svg',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            /// BlocConsumer
            BlocConsumer<UpdateUserProfileBloc, UpdateUserProfileState>(
              listener: (context, state) async {
                await state.map(
                  initial: (_) {
                    setState(() => isLoading = false);
                  },
                  loading: (_) {
                    setState(() => isLoading = true);
                  },
                  updateuser: (success) async {
                    setState(() => isLoading = false);

                    final phoneNumber = success.updateuser.user?.phoneNumber;

                    if (phoneNumber != null) {
                      final userDetails = UserDetailsDB(phone: phoneNumber);
                      final box =
                          await Hive.openBox<UserDetailsDB>('userDetailsBox');
                      await box.put('user', userDetails);
                    }

                    Navigator.pop(context, phoneNumber); // return phone
                  },
                  updateFailure: (failure) {
                    setState(() => isLoading = false);
                    CustomToast.showFlushBar(
                      context: context,
                      status: false,
                      title: "Error",
                      content: failure.error,
                    );
                  },
                  loginvaldationFailure: (failure) {
                    setState(() {
                      isLoading = false;
                      final validation = failure.profileUpdateValidation;
                      final phoneErrors = validation.errors?.phone;
                      final genericError =
                          "these credentials do not match our records.";

                      phoneErrorText = (phoneErrors != null &&
                              !(phoneErrors.first.toLowerCase().trim() ==
                                  genericError))
                          ? phoneErrors.first
                          : null;
                    });

                    CustomToast.showFlushBar(
                      context: context,
                      status: false,
                      title: "Error",
                      content: failure.profileUpdateValidation.message ??
                          'Validation error',
                    );
                  },
                  noInternet: (_) {
                    setState(() => isLoading = false);
                    CustomToast.showFlushBar(
                      context: context,
                      status: false,
                      title: "Oops",
                      content: "No Internet connection. Please try again.",
                    );
                  },
                );
              },
              builder: (context, state) {
                return FullWidthRectangleBlueButton(
                  text: "Continue",
                  onPressed: isLoading
                      ? null
                      : () {
                          _startListening();
                          String phone = _phoneController.text.trim();

                          // Block submission if error is present
                          if (phoneErrorText != null) return;

                          if (!phone.startsWith('+91')) {
                            phone = '+91$phone';
                          }

                          context.read<UpdateUserProfileBloc>().add(
                                UpdateUserProfileEvent.updateprofile(
                                  phone: phone,
                                ),
                              );
                        },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
