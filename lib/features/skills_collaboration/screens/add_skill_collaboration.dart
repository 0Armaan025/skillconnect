import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/constants.dart';
import '../../../common/utils.dart';

class AddSkillCollaborationScreen extends StatefulWidget {
  const AddSkillCollaborationScreen({super.key});

  @override
  State<AddSkillCollaborationScreen> createState() =>
      _AddSkillCollaborationScreenState();
}

class _AddSkillCollaborationScreenState
    extends State<AddSkillCollaborationScreen> {
  @override
  Widget build(BuildContext context) {
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
              height: 10,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Need Help? Or Wanna Collab on something?",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "For that!, you are at the right place!",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
