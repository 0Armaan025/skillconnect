import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillconnect/features/meet_booking/meet_booking_screen.dart';

import '../../../common/constants.dart';
import '../../../common/utils.dart';

class GetMentoredScreen extends StatefulWidget {
  const GetMentoredScreen({super.key});

  @override
  State<GetMentoredScreen> createState() => GetMentoredScreenState();
}

class GetMentoredScreenState extends State<GetMentoredScreen> {
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
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Hey there!👋, I'm Armaan!",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ), //will add dynamic data once connected to firebase cloud firetore
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                "I'm a Flutter Developer, \nand I'm here to help you!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: Text(
                "I'm free from 9 AM to 12:45 PM\nevery day except sunday!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade800, Colors.blue.shade500],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.shade200,
                    blurRadius: 10,
                    spreadRadius: 3,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      moveScreen(context, MeetBookingScreen());
                      print('Button pressed');
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 36.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.calendarAlt,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Book a meet',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //let's win this and finish this app! 🔥
          ],
        ),
      ),
    );
  }
}
