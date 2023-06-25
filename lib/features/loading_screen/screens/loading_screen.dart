import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../common/constants.dart';
import '../../../common/utils.dart';

class LoadingScreen extends StatefulWidget {
  final String networkLink;
  final String text;
  final bool lastScreen;
  const LoadingScreen(
      {super.key,
      required this.networkLink,
      required this.text,
      this.lastScreen = false});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.lastScreen == false) {
      Timer(
        const Duration(seconds: 5),
        () => moveScreen(
          context,
          const LoadingScreen(
            networkLink:
                'https://assets7.lottiefiles.com/private_files/lf30_nsqfzxxx.json',
            text: "Meeting scheduled!",
            lastScreen: true,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: buildDrawer(context),
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: makeAppBar(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Lottie.network(widget.networkLink),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                widget.text,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
