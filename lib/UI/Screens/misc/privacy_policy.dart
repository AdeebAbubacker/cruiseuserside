import 'package:flutter/material.dart';
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
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
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
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SectionHeader(title: "Introduction"),
            PrivacyPoint(
                number: 1,
                text:
                    "Your privacy is important to us. This policy explains how we collect, use, and safeguard your information."),
            PrivacyPoint(
                number: 2,
                text:
                    "By using our app, you consent to the practices described in this policy."),
            SectionHeader(title: "Data Collection"),
            PrivacyPoint(
                number: 3,
                text:
                    "We may collect personal information such as your name, email, and contact number."),
            PrivacyPoint(
                number: 4,
                text:
                    "We also collect app usage data, crash reports, and device information for performance improvements."),
            PrivacyPoint(
                number: 5,
                text:
                    "Location data may be collected to provide region-specific services."),
            SectionHeader(title: "Use of Data"),
            PrivacyPoint(
                number: 6,
                text:
                    "We use collected data to enhance user experience and improve our services."),
            PrivacyPoint(
                number: 7,
                text:
                    "Data may be used for analytics, feature development, and customer support."),
            PrivacyPoint(
                number: 8,
                text: "We do not sell your personal data to third parties."),
            SectionHeader(title: "Data Sharing"),
            PrivacyPoint(
                number: 9,
                text:
                    "We may share your data with service providers who assist in app functionality."),
            PrivacyPoint(
                number: 10,
                text:
                    "Your data may be disclosed to legal authorities if required by law."),
            SectionHeader(title: "Security"),
            PrivacyPoint(
                number: 11,
                text:
                    "We use encryption and secure storage to protect your information."),
            PrivacyPoint(
                number: 12,
                text:
                    "Access to personal data is restricted to authorized personnel only."),
            SectionHeader(title: "User Rights"),
            PrivacyPoint(
                number: 13,
                text:
                    "You can access and update your personal data through the app settings."),
            PrivacyPoint(
                number: 14,
                text:
                    "You can request deletion of your account and associated data."),
            PrivacyPoint(
                number: 15,
                text:
                    "You can opt out of receiving promotional communications at any time."),
            SectionHeader(title: "Cookies and Tracking"),
            PrivacyPoint(
                number: 16,
                text:
                    "We may use cookies or similar technologies to enhance your user experience."),
            PrivacyPoint(
                number: 17,
                text:
                    "You can manage cookie preferences through your device settings."),
            SectionHeader(title: "Policy Updates"),
            PrivacyPoint(
                number: 18,
                text: "This privacy policy may be updated from time to time."),
            PrivacyPoint(
                number: 19,
                text:
                    "Significant changes will be communicated through the app or email."),
            SectionHeader(title: "Contact Information"),
            PrivacyPoint(
                number: 20,
                text:
                    "If you have questions about this policy, contact us at info.cruisebuddy@gmail.com."),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 6.0),
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

class PrivacyPoint extends StatelessWidget {
  final int number;
  final String text;
  const PrivacyPoint({super.key, required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$number. ",
            style: GoogleFonts.ubuntu(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.left,
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
