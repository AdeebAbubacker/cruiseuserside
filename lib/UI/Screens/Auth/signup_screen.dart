import 'package:cruise_buddy/UI/Widgets/Button/full_width_bluebutton.dart';
import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:cruise_buddy/core/routes/app_routes.dart';
import 'package:cruise_buddy/core/view_model/regsiter/register_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypepasswordController = TextEditingController();

  bool isTextVisible = false;
  bool isChecked = false;
  FocusNode nameFocusNode = FocusNode();
  FocusNode phonenumberFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode reTypepasswordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          state.map(
            initial: (value) {
              print(value);
            },
            loading: (value) {
              print(value);
            },
            registrationSuccess: (value) {
              AppRoutes.navigateToMainLayoutScreen(context);
            },
            registrationFailure: (value) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(value.error)));
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
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
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
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'assets/image/auth_img/Signup.png',
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
                          text: "Hello ",
                          style: TextStyles.ubuntu32blue24w2900,
                        ),
                        TextSpan(
                          text: "there!",
                          style: TextStyles.ubuntu32black24w2900,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Join us and unlock access to a world of boating experiences at your fingertips.",
                    style: TextStyles.ubuntu16black55w400,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Full Name",
                    style: TextStyles.ubuntu16black23w700,
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                              'assets/image/auth_img/icon_name.svg'),
                        )),
                    controller: nameController,
                    focusNode: nameFocusNode,
                  ),
                  const SizedBox(height: 12),
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
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                              'assets/image/auth_img/ion_mail-outline.svg'),
                        )),
                    controller: emailController,
                    focusNode: emailFocusNode,
                  ),
                  const SizedBox(height: 18),
                  Text(
                    "Create Password",
                    style: TextStyles.ubuntu16black23w700,
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                              'assets/image/auth_img/icon_password-outline.svg'),
                        ),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                //  isTextVisible = !isTextVisible;
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
                  Text(
                    "Re-type your Password",
                    style: TextStyles.ubuntu16black23w700,
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                              'assets/image/auth_img/icon_password-outline.svg'),
                        ),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                //  isTextVisible = !isTextVisible;
                              });
                            },
                            child: Icon(isTextVisible
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32))),
                    controller: retypepasswordController,
                    focusNode: reTypepasswordFocusNode,
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
                      RichText(
                        text: TextSpan(
                          text: 'By signing up you agree to our\n',
                          style: TextStyles.ubuntu16black23w300,
                          children: [
                            TextSpan(
                              text: 'Terms of Services',
                              style: TextStyles.ubuntu16blue86w600,
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                            TextSpan(
                              text: ' and ',
                              style: TextStyles.ubuntu16black23w300,
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyles.ubuntu16blue86w600,
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                            TextSpan(
                              text: '.',
                              style: TextStyles.ubuntu16black23w300,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  FullWidthBlueButton(
                    text: 'Signup',
                    onPressed: () {
                      BlocProvider.of<RegisterBloc>(context).add(
                        RegisterEvent.loginRequested(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          confirmPassword: retypepasswordController.text,
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                        child: Text("or sign up with"),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 201, 201, 201)),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/Google.png"),
                        )),
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Join Already have an account? ",
                            style: TextStyles.ubuntu16black23w400,
                          ),
                          TextSpan(
                            text: "Sign in.",
                            style: TextStyles.ubuntu16blue86w600,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
