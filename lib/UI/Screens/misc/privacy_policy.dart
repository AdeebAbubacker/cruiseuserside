import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 255, 248),
      appBar: AppBar(
        elevation: 5,
        backgroundColor: const Color.fromARGB(255, 252, 255, 248),
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        title: Text(
          "Privacy Policy",
          style: GoogleFonts.ubuntu(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(title: "Introduction"),
              PrivacyPoints(
                text: "A brief description of the purpose of the policy:",
              ),
              PrivacyPoints(
                text:
                    '"Your privacy is important to us. This policy explains how we collect, use, and protect your data."',
              ),
              SectionHeader(title: "1. Sections"),
              PrivacyPoints(
                text:
                    "Organized as collapsible or scrollable sections for easy navigation:",
              ),
              SectionHeader(title: "2. Data Collection"),
              PrivacyPoints(
                text:
                    "Information on what data is collected (e.g., name, contact details, payment info, location data).",
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text(
                  'Privacy Policy',
                  style: TextStyles.ubuntu16black23wBold,
                ),
                trailing: SvgPicture.asset(
                  'assets/image/profile/arrow_right.svg',
                ),
                onTap: () {},
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text(
                  'Data Sharing',
                  style: TextStyles.ubuntu16black23wBold,
                ),
                trailing: SvgPicture.asset(
                  'assets/image/profile/arrow_right.svg',
                ),
                onTap: () {},
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text(
                  ' Security Measures',
                  style: TextStyles.ubuntu16black23wBold,
                ),
                trailing: SvgPicture.asset(
                  'assets/image/profile/arrow_right.svg',
                ),
                onTap: () {},
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text(
                  'User Rights',
                  style: TextStyles.ubuntu16black23wBold,
                ),
                trailing: SvgPicture.asset(
                  'assets/image/profile/arrow_right.svg',
                ),
                onTap: () {},
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text(
                  'Contact Information',
                  style: TextStyles.ubuntu16black23wBold,
                ),
                trailing: SvgPicture.asset(
                  'assets/image/profile/arrow_right.svg',
                ),
                onTap: () {},
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text(
                  'Call-to-Actions',
                  style: TextStyles.ubuntu16black23wBold,
                ),
                trailing: SvgPicture.asset(
                  'assets/image/profile/arrow_right.svg',
                ),
                onTap: () {},
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: GoogleFonts.ubuntu(
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class PrivacyPoints extends StatelessWidget {
  final String text;
  const PrivacyPoints({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 9.0),
            child: Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.ubuntu(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
