import 'dart:io';

import 'package:cruise_buddy/UI/Widgets/Button/full_width_bluebutton.dart';
import 'package:cruise_buddy/UI/Widgets/toast/custom_toast.dart';
import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:cruise_buddy/core/db/hive_db/adapters/user_details_adapter.dart';
import 'package:cruise_buddy/core/db/hive_db/boxes/user_details_box.dart';
import 'package:cruise_buddy/core/routes/app_routes.dart';
import 'package:cruise_buddy/core/view_model/login/login_bloc.dart';
import 'package:cruise_buddy/core/view_model/postGoogleId/post_google_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:in_app_update/in_app_update.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      checkForUpdate();
    });
  }

  String? emailErrorText;
  String? passwordErrorText;
  Future<void> checkForUpdate() async {
    try {
      final updateInfo = await InAppUpdate.checkForUpdate();

      if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
        InAppUpdate.performImmediateUpdate().catchError((e) {});
      }
    } catch (e) {}
  }

  String? userEmail;

  // Google Sign-In Function
  Future<void> signInWithGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      if (await googleSignIn.isSignedIn()) {
        await googleSignIn.signOut();
        print("Signed out");
      }
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return; // User canceled sign-in

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        setState(() {
          userEmail = user.email;
        }); // Dispatch event to PostGoogleBloc after successful Google Sign-In
        print("mobeeeeeeeeeeeeeeeeeeee ${userEmail}");
        print("mobeeeeeeeeeeeeeeeeeeee ${user.phoneNumber}");
        BlocProvider.of<PostGoogleBloc>(context).add(
          PostGoogleEvent.added(
            UId: user.uid,
            name: user.displayName.toString(),
          ),
        );
      }
    } catch (e) {
      print("Google Sign-In Error: $e");
    }
  }



  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  bool isTextVisible = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: MultiBlocListener(
        listeners: [
          BlocListener<LoginBloc, LoginState>(
            listener: (context, state) async {
              await state.map(
                initial: (_) {
                  print('initial');
                },
                loading: (_) {
                  print('loading');
                },
                loginvaldationFailure: (value) {
                  print('validation failed ${value.loginValidation.message}');

                  final genericError =
                      "these credentials do not match our records.";

                  final emailErrors = value.loginValidation.errors?.email;
                  final passwordErrors = value.loginValidation.errors?.password;

                  // Normalize and check
                  final emailError = emailErrors != null &&
                          !(emailErrors.first.toLowerCase().trim() ==
                              genericError)
                      ? emailErrors.first
                      : null;

                  final passwordError = passwordErrors != null &&
                          !(passwordErrors.first.toLowerCase().trim() ==
                              genericError)
                      ? passwordErrors.first
                      : null;

                  setState(() {
                    emailErrorText = emailError;
                    passwordErrorText = passwordError;
                  });

                  CustomToast.showFlushBar(
                    context: context,
                    status: false,
                    title: "Error",
                    content:
                        value.loginValidation.message ?? "Validation error",
                  );
                },
                loginSuccess: (success) async {
                  final loginModel = success
                      .loginModel; // assuming you have loginModel inside state

                  if (loginModel.user != null) {
                    // Create UserDetailsDB from LoginModel's user
                    final userDetails = UserDetailsDB(
                      name: loginModel.user?.name ?? "",
                      email: loginModel.user?.email ?? '',
                      phone: loginModel.user?.phoneNumber,
                      // Assuming you don't have an image in User
                    );

                    // Save it to Hive
                    await userDetailsBox.put('user', userDetails);
                  }
                  AppRoutes.navigateToMainLayoutScreen(context);
                },
                loginFailure: (failure) {
                  CustomToast.showFlushBar(
                    context: context,
                    status: false,
                    title: "Error",
                    content: failure.error ?? "Validation error",
                  );
                },
                noInternet: (value) {
                  CustomToast.showFlushBar(
                    context: context,
                    status: false,
                    title: "Oops",
                    content: "No Internet please try again",
                  );
                },
              );
            },
          ),
          BlocListener<PostGoogleBloc, PostGoogleState>(
            listener: (context, state) {
              state.map(
                initial: (_) {
                  print('initial');
                },
                loading: (_) {
                  print('loading');
                },
                addedSuccess: (success) async {
                  print('success');
                  final loginModel = success.gmailresponse
                      .user; // assuming you have loginModel inside state

                  if (loginModel != null) {
                    // Create UserDetailsDB from LoginModel's user
                    final userDetails = UserDetailsDB(
                      name: loginModel.name ?? "",
                      email: loginModel.email ?? '',
                      phone: loginModel.phoneNumber,
                      // Assuming you don't have an image in User
                    );

                    // Save it to Hive
                    await userDetailsBox.put('user', userDetails);
                  }
                  AppRoutes.navigateToMainLayoutScreen(context);
                },
                addedFailure: (failure) {
                  print('failure');
                  CustomToast.showFlushBar(
                    context: context,
                    status: false,
                    title: "Oops",
                    content: "Something went wrong",
                  );
                },
                noInternet: (value) {
                  CustomToast.showFlushBar(
                    context: context,
                    status: false,
                    title: "Oops",
                    content: "No Internet please try again",
                  );
                },
              );
            },
          ),
        ],
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 70),
                  Center(
                    child: Container(
                      width: 80, // Equal width and height
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 201, 201, 201),
                        ),
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/icons/emailLogo.svg',
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "welcome ",
                          style: TextStyles.ubuntu32blue24w2900,
                        ),
                        TextSpan(
                          text: "back!",
                          style: TextStyles.ubuntu32black24w2900,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Your gateway to seamless boat rentals and memorable experiences on the water.",
                    style: TextStyles.ubuntu16black55w400,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Email Address",
                    style: TextStyles.ubuntu16black23w700,
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    style: TextStyles.ubuntutextfieldText,
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      hintStyle: TextStyles.ubuntuhintText,
                      errorText: emailErrorText,
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
                    controller: emailController,
                    focusNode: emailFocusNode,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Password",
                        style: TextStyles.ubuntu16black23w700,
                      ),
                      const Spacer(),
                      // TextButton(
                      //   onPressed: () {},
                      //   child: Text(
                      //     "Forgot Password?",
                      //     style: TextStyles.ubuntu12blue23w700,
                      //   ),
                      // ),
                    ],
                  ),
                  TextField(
                    style: TextStyles.ubuntutextfieldText,
                    obscureText: isTextVisible,
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      hintStyle: TextStyles.ubuntuhintText,
                      errorText: passwordErrorText,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset(
                          'assets/image/auth_img/icon_password-outline.svg',
                        ),
                      ),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isTextVisible = !isTextVisible;
                            });
                          },
                          child: Icon(isTextVisible
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      MSHCheckbox(
                        size: 25,
                        value: isChecked,
                        colorConfig:
                            MSHColorConfig.fromCheckedUncheckedDisabled(
                          checkedColor: const Color(0xFF1F8386),
                        ),
                        style: MSHCheckboxStyle.stroke,
                        onChanged: (selected) {
                          setState(() {
                            isChecked = selected;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text("Keep me signed in",
                          style: TextStyles.ubuntu16black23w300),
                    ],
                  ),
                  const SizedBox(height: 22),
                  FullWidthBlueButton(
                    text: 'Login',
                    onPressed: () {
                      BlocProvider.of<LoginBloc>(context).add(
                        LoginEvent.loginRequested(
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "or sign in with",
                          style: GoogleFonts.ubuntu(),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, loginState) {
                      return loginState.maybeMap(
                        orElse: () {
                          return GestureDetector(
                            onTap: signInWithGoogle,
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 201, 201, 201),
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                          'assets/icons/Google.svg'),
                                ),
                              ),
                            ),
                          );
                        },
                        initial: (_) {
                          return BlocBuilder<PostGoogleBloc, PostGoogleState>(
                            builder: (context, postGoogleState) {
                              return postGoogleState.map(
                                initial: (_) {
                                  return GestureDetector(
                                    onTap: signInWithGoogle,
                                    child: Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 201, 201, 201),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset(
                                                  'assets/icons/Google.svg'),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                loading: (_) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                                addedSuccess: (_) {
                                  return GestureDetector(
                                    onTap: signInWithGoogle,
                                    child: Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 201, 201, 201),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child:SvgPicture.asset(
                                                  'assets/icons/Google.svg'),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                addedFailure: (_) {
                                  return GestureDetector(
                                    onTap: signInWithGoogle,
                                    child: Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 201, 201, 201),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child:SvgPicture.asset(
                                                  'assets/icons/Google.svg'),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                noInternet: (_) {
                                  return GestureDetector(
                                    onTap:signInWithGoogle,
                                    child: Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 201, 201, 201),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child:  SvgPicture.asset(
                                                  'assets/icons/Google.svg'),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                        loading: (_) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        loginSuccess: (_) {
                          return GestureDetector(
                            onTap: signInWithGoogle,
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 201, 201, 201),
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                          'assets/icons/Google.svg'),
                                ),
                              ),
                            ),
                          );
                        },
                        loginFailure: (_) {
                          return GestureDetector(
                            onTap: signInWithGoogle,
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 201, 201, 201),
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                          'assets/icons/Google.svg'),
                                ),
                              ),
                            ),
                          );
                        },
                        noInternet: (_) {
                          return GestureDetector(
                            onTap: signInWithGoogle,
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 201, 201, 201),
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                          'assets/icons/Google.svg'),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Don’t have an account?",
                              style: TextStyles.ubuntu16black23w400,
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          AppRoutes.navigateToRegistartionScreen(context);
                        },
                        child: Text(
                          "Create an account",
                          style: TextStyles.ubuntu12blue23w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:[ TextButton(
                        onPressed: () {
                          AppRoutes.navigateToGuestUi(context);
                        },
                        child: Text(
                          "Loin As guest",
                          style: TextStyles.ubuntu12blue23w700,
                        ),
                      ),]),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//  SHA1: 0D:0E:CD:12:74:95:1C:4E:2B:CA:14:55:4F:DE:0C:E7:C3:38:7A:77
// SHA256: E5:C5:06:8E:9B:AC:A6:01:3D:FA:E3:DB:99:54:A0:A9:A1:10:58:E7:ED:BC:D9:82:0B:FA:3F:E7:4F:01:C3:6B
