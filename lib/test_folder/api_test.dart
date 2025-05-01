import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
class dgdfgdfg extends StatelessWidget {
  Future<void> logoutFromGmail() async {
    try {
      await GoogleSignIn().signOut(); // Sign out from Google
      await FirebaseAuth.instance.signOut(); // Sign out from Firebase
    } catch (e) {
      print('Logout failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (user != null)
              Text('Logged in as: ${user.displayName ?? user.email}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await logoutFromGmail();
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => RFYGYFT()),
                // );
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
