import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:skillconnect/common/utils.dart';
import 'package:skillconnect/features/auth/frontend/screens/login/login_screen.dart';

import '../../../common/constants.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
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
                    "SkillConnect: ${appTagline} Join a vibrant community of passionate individuals. Share your expertise, find mentors, and expand your skills. Unleash your potential and transform the way we learn and thrive together!"),
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
                  moveScreen(context, const LoginScreen(),
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
