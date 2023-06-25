import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillconnect/features/skills_collaboration/screens/add_skill_collaboration.dart';

import '../../../common/constants.dart';
import '../../../common/utils.dart';

class SkillCollaborativeWidget extends StatefulWidget {
  const SkillCollaborativeWidget({super.key});

  @override
  State<SkillCollaborativeWidget> createState() =>
      _SkillCollaborativeWidgetState();
}

class _SkillCollaborativeWidgetState extends State<SkillCollaborativeWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.25,
      width: 230,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage('https://picsum.photos/120'),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Armaan",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "armaan33000@gmail.com",
                    style: GoogleFonts.poppins(fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              "Lorem ispum lorem ispum lorem ispum lorem ispum",
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () {
                moveScreen(context, const AddSkillCollaborationScreen());
              },
              child: Container(
                width: double.infinity,
                height: 30,
                margin: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: const LinearGradient(
                    colors: [Colors.blue, Colors.green],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Text(
                    "Collaborate",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
