import 'package:cruise_buddy/core/constants/colors/app_colors.dart';
import 'package:cruise_buddy/core/view_model/deleteAccount/delete_account_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({
    super.key,
  });

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _captcha = '';
  String? _captchaErrorText;
  final TextEditingController _captchaController = TextEditingController();
  final TextEditingController _userInputController = TextEditingController();
  final FocusNode captchaFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _generateCaptcha();
  }

  void _generateCaptcha() {
    final random = Random();
    const chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    _captcha =
        List.generate(6, (index) => chars[random.nextInt(chars.length)]).join();
    _captchaController.text = _captcha;
  }

  void _verifyCaptcha() {
    if (_userInputController.text == _captcha) {
      print("Matched");
    } else {
      print("Incorrect Captcha");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text(
          "Delete Account",
          style: GoogleFonts.ubuntu(),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            captchaFocus.unfocus();
          },
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 15,
                              right: 15,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Text(
                                  "Are you sure you want to delete your account?",
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 22),
                                Text(
                                  "Deleting your Cruise Buddy account will permanently remove all public and private information associated with your profile. You must cancel your subscription before deleting your account. To confirm the permanent deletion, please fill in the CAPTCHA below and click 'Delete Account'.",
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 14,
                                    color:
                                        const Color.fromARGB(255, 61, 61, 61),
                                  ),
                                ),
                                SizedBox(height: 22),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CaptchaTextField(
                                      textEditingController: _captchaController,
                                      refresh: _generateCaptcha,
                                      textstyle: TextStyle(),
                                    ),
                                    const SizedBox(height: 20),
                                    Textfield(
                                      focusNode: captchaFocus,
                                      errorText: _captchaErrorText,
                                      hintText: 'Enter Captcha Here',
                                      textEditingController:
                                          _userInputController,
                                    ),
                                    const SizedBox(height: 20),
                                    Center(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Colors.red, // Danger color
                                          foregroundColor:
                                              Colors.white, // Text color
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 40, vertical: 14),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                8), // Slightly rounded corners
                                          ),
                                          elevation: 3,
                                        ),
                                        onPressed: () async {
                                          if (_userInputController.text ==
                                              _captcha) {
                                            print("Matched");
                                            setState(() {
                                              _captchaErrorText = null;
                                            });
                                          } else {
                                            setState(() {
                                              _captchaErrorText =
                                                  'Incorrect Captcha';
                                            });
                                            BlocProvider.of<DeleteAccountBloc>(
                                                    context)
                                                .add(DeleteAccountEvent
                                                    .deleteAccount());
                                            print("Not Matched");
                                          }
                                        },
                                        child: Text(
                                          'Delete Account',
                                          style: GoogleFonts.ubuntu(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CaptchaTextField extends StatelessWidget {
  var errorText;
  final String? hintText;
  final bool enabled;
  final VoidCallback refresh;
  TextEditingController textEditingController;
  final TextStyle textstyle;

  CaptchaTextField({
    super.key,
    this.hintText,
    required this.textEditingController,
    required this.textstyle,
    required this.refresh,
    this.errorText,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFE5E5E5), // Set the entire background to grey
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: Colors.grey, // Set border color to grey
          width: 1, // Set border width
        ),
      ),
      child: TextField(
        readOnly: true,
        enabled: enabled,
        controller: textEditingController,
        decoration: InputDecoration(
          // labelText: "Captcha",

          contentPadding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          hintText: hintText,
          errorText: errorText,
          border: InputBorder.none, // Remove default border
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: refresh,
              child: SvgPicture.asset(
                'assets/refresh_icon.svg',
                height: 2,
                width: 5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Textfield extends StatelessWidget {
  var errorText;
  final String? hintText;
  final bool enabled;
  final FocusNode focusNode;
  TextEditingController textEditingController = TextEditingController();
  final TextStyle textstyle;
  bool isSpecialCharAllowed;
  Textfield({
    super.key,
    this.hintText,
    required this.textEditingController,
    required this.focusNode,
    TextStyle? textstyle,
    this.errorText,
    this.enabled = true,
    this.isSpecialCharAllowed = true,
  }) : textstyle = textstyle ?? GoogleFonts.ubuntu();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.all(Radius.circular(9)),
      ),
      child: TextField(
        focusNode: focusNode,
        style: textstyle,
        enabled: enabled,
        controller: textEditingController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          hintText: hintText,
          errorText: errorText,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 4,
              color: Colors.red,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(9),
            ),
          ),
        ),
        inputFormatters: isSpecialCharAllowed
            ? null
            : [
                FilteringTextInputFormatter.allow(RegExp(
                    r'[a-zA-Z0-9\s]')), // Allow only letters, numbers, and spaces
              ],
      ),
    );
  }
}
