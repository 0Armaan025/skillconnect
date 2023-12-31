import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:skillconnect/common/utils.dart';
import 'package:skillconnect/features/auth/frontend/screens/signup/signup_screen.dart';
import 'package:skillconnect/features/home_screen/screens/home_screen.dart';

import '../../../common/constants.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    uid = firebaseAuth.currentUser?.uid ?? '';

    if (firebaseAuth.currentUser != null) {
      getData();
    } else {}
  }

  void getData() {
    var data = firestore
        .collection('users')
        .doc(uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      userName = snapshot.get('name');
      userProfileUrl = snapshot.get('profilePictureUrl');
      email = snapshot.get('email');
      userDetails = snapshot.get('details');
      userSkills = snapshot.get('skills') as List<String>;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: makeAppBar(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Lottie.network(
                'https://assets3.lottiefiles.com/packages/lf20_3vbOcw.json'),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Welcome to ${appName}",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Center(
                child: Text(
                    "SkillConnect: ${appTagline} Join SkillConnect, meet mentors, get amazing skill knowledge from courses! learn from people in the chat, get some amazing job opportunities and collab for being a team and for doing the dream work!"),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: size.width * 0.7,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.deepPurple.withOpacity(0.5),
                        blurRadius: 20,
                        offset: const Offset(0, 10))
                  ]),
              child: MaterialButton(
                onPressed: () {
                  moveScreen(
                      context,
                      firebaseAuth.currentUser != null
                          ? HomeScreen()
                          : const SignUpScreen(),
                      isPushReplacement: true);
                },
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
