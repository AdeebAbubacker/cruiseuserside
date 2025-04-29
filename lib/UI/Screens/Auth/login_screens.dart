import 'package:cruise_buddy/UI/Widgets/Button/full_width_bluebutton.dart';
import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:cruise_buddy/core/routes/app_routes.dart';
import 'package:cruise_buddy/core/view_model/login/login_bloc.dart';
import 'package:cruise_buddy/core/view_model/postGoogleId/post_google_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? userEmail;

  // Google Sign-In Function
  // Future<void> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     if (googleUser == null) return; // User canceled sign-in

  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;
  //     final OAuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );

  //     final UserCredential userCredential =
  //         await FirebaseAuth.instance.signInWithCredential(credential);
  //     final User? user = userCredential.user;

  //     if (user != null) {
  //       setState(() {
  //         userEmail = user.email;
  //       }); // Dispatch event to PostGoogleBloc after successful Google Sign-In
  //       print("mobeeeeeeeeeeeeeeeeeeee");
  //       // BlocProvider.of<PostGoogleBloc>(context).add(
  //       //   PostGoogleEvent.added(
  //       //     UId: user.uid,
  //       //     name: user.displayName.toString(),
  //       //   ),
  //       // );
  //     }
  //   } catch (e) {
  //     print("Google Sign-In Error: $e");
  //   }
  // }
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(); // Reuse instance
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) return; // User canceled sign-in

      // Get authentication tokens
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Only proceed if tokens are available
      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        throw Exception("Missing Google authentication tokens");
      }

      // Firebase authentication
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
        });

        print("Google Sign-In Success: ${user.email}");
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
            listener: (context, state) {
              state.map(
                initial: (_) {
                  print('initial');
                },
                loading: (_) {
                  print('loading');
                },
                loginSuccess: (success) {
                  AppRoutes.navigateToMainLayoutScreen(context);
                },
                loginFailure: (failure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("//${failure.error}"),
                    ),
                  );
                },
                noInternet: (value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("No Internet please try again"),
                    ),
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
                addedSuccess: (success) {
                  AppRoutes.navigateToMainLayoutScreen(context);
                },
                addedFailure: (failure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("//${failure.error}"),
                    ),
                  );
                },
                noInternet: (value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("No Internet please try again"),
                    ),
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
                    child: Image.asset(
                      'assets/email_logo.png',
                      width: 120,
                      height: 120,
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
                    decoration: InputDecoration(
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
                  Row(
                    children: [
                      Text(
                        "Password",
                        style: TextStyles.ubuntu16black23w700,
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password?",
                          style: TextStyles.ubuntu12blue23w700,
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    obscureText: isTextVisible,
                    decoration: InputDecoration(
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
                            borderRadius: BorderRadius.circular(32))),
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
                  const SizedBox(height: 12),
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
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("or sign in with"),
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
                      return loginState.map(
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
                                          child:
                                              Image.asset("assets/Google.png"),
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
                                          child:
                                              Image.asset("assets/Google.png"),
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
                                          child:
                                              Image.asset("assets/Google.png"),
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
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child:
                                              Image.asset("assets/Google.png"),
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
                                  child: Image.asset("assets/Google.png"),
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
                                  child: Image.asset("assets/Google.png"),
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
                                  child: Image.asset("assets/Google.png"),
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
                  const SizedBox(height: 40)
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