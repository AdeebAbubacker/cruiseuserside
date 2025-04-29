import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

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
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          "Terms & Conditions",
          style: GoogleFonts.ubuntu(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(title: "Welcome to Cruise Buddy"),
              PrivacyPoints(
                text:
                    "By accessing or using the Cruise Buddy app, you agree to be bound by these Terms and Conditions.",
              ),
              SectionHeader(title: "1. Booking Policy"),
              PrivacyPoints(
                text:
                    "All bookings are subject to availability and confirmation.",
              ),
              PrivacyPoints(
                text:
                    "Once confirmed, cancellations and changes may be subject to charges as per our cancellation policy.",
              ),
              SectionHeader(title: "2. Payment Terms"),
              PrivacyPoints(
                text:
                    "Full or partial payment must be completed at the time of booking, depending on the package.",
              ),
              PrivacyPoints(
                text:
                    "We use secure payment gateways to ensure your data remains safe.",
              ),
              SectionHeader(title: "3. User Conduct"),
              PrivacyPoints(
                text:
                    "Users are expected to behave respectfully during the cruise and follow all instructions from staff.",
              ),
              SectionHeader(title: "4. Liability"),
              PrivacyPoints(
                text:
                    "Cruise Buddy is not responsible for personal belongings lost during the trip.",
              ),
              PrivacyPoints(
                text:
                    "In the event of natural calamities or unforeseen events, Cruise Buddy reserves the right to cancel or reschedule bookings.",
              ),
              SectionHeader(title: "5. Changes to Terms"),
              PrivacyPoints(
                text:
                    "Cruise Buddy may update these Terms & Conditions at any time. Continued use of the app constitutes agreement to the updated terms.",
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoTile({required String title}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ListTile(
        title: Text(
          title,
          style: TextStyles.ubuntu16black23wBold,
        ),
        trailing: SvgPicture.asset('assets/image/profile/arrow_right.svg'),
        onTap: () {
          // Optional: Navigate to detailed page or show modal
        },
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
          const Padding(
            padding: EdgeInsets.only(top: 9.0),
            child: CircleAvatar(
              radius: 2.5,
              backgroundColor: Colors.black,
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
