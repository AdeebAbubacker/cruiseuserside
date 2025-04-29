import 'package:cruise_buddy/UI/Widgets/Button/full_width_bluebutton.dart';
import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();

  void _hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _hideKeyboard();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    border: Border.all(
                      color: const Color.fromARGB(255, 183, 183, 183),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(
                      'assets/lock_icon.png',
                      width: 120,
                      height: 120,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Forgot ",
                      style: TextStyles.ubuntu32blue24w2900,
                    ),
                    TextSpan(
                      text: "password ?",
                      style: TextStyles.ubuntu32black24w2900,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Allow users to securely reset their password if they have trouble logging in.",
                style: TextStyles.ubuntu16black55w400,
              ),
              const SizedBox(height: 60),
              Center(
                child: Text(
                  "Please enter the 4 digit code sent to hello@example.com",
                  style: TextStyles.ubuntu16black23w700,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      OtpPinField(
                        autoFocus: false,
                        fieldHeight: 60,
                        fieldWidth: 60,
                        key: _otpPinFieldController,
                        autoFillEnable: false,
                        textInputAction: TextInputAction.done,
                        onSubmit: (text) {
                          debugPrint('Entered pin is $text');
                        },
                        onChange: (text) {
                          debugPrint('Enter on change pin is $text');
                        },
                        onCodeChanged: (code) {
                          debugPrint('onCodeChanged is $code');
                        },
                        otpPinFieldStyle: OtpPinFieldStyle(
                          textStyle: TextStyles.ubuntu32blue86w700,
                          fieldBorderRadius: 20,
                          fieldBorderWidth: 1.5,
                          fieldPadding:
                              MediaQuery.of(context).size.width * 0.05,
                          hintTextColor: Colors.grey,
                          showHintText: true,
                          activeFieldBorderGradient: const LinearGradient(
                            colors: [
                              Color(0xFF1F8386),
                              Color(0xFF1F8386),
                            ],
                          ),
                          filledFieldBorderGradient: const LinearGradient(
                            colors: [
                              Colors.black,
                              Colors.black,
                            ],
                          ),
                          defaultFieldBorderGradient: const LinearGradient(
                            colors: [
                              Colors.grey,
                              Colors.grey,
                            ],
                          ),
                        ),
                        maxLength: 4,
                        showCursor: true,
                        cursorColor: Colors.grey,
                        upperChild: const Column(
                          children: [
                            SizedBox(height: 30),
                            Icon(Icons.flutter_dash_outlined, size: 150),
                            SizedBox(height: 20),
                          ],
                        ),
                        middleChild: Column(
                          children: [
                            const SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: () {
                                _otpPinFieldController.currentState?.clearOtp();
                              },
                              child: const Text('Clear OTP'),
                            ),
                          ],
                        ),
                        cursorWidth: 2,
                        mainAxisAlignment: MainAxisAlignment.center,
                        otpPinFieldDecoration: OtpPinFieldDecoration.custom,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              FullWidthBlueButton(
                text: 'Verify',
                onPressed: () {},
              ),
              const SizedBox(
                height: 12,
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Resend Code",
                    style: TextStyles.ubuntu16blue86w400,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
