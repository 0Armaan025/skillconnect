import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/constants.dart';
import '../../../common/utils.dart';

class AddSkillCollaborationScreen extends StatefulWidget {
  const AddSkillCollaborationScreen({super.key});

  @override
  _AddSkillCollaborationScreenState createState() =>
      _AddSkillCollaborationScreenState();
}

class _AddSkillCollaborationScreenState
    extends State<AddSkillCollaborationScreen> {
  List<String> selectedSkills = [];

  void selectSkill(String skill) {
    setState(() {
      if (selectedSkills.contains(skill)) {
        selectedSkills.remove(skill);
      } else {
        selectedSkills.add(skill);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: buildDrawer(),
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
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "Need Help? Or Wanna Collab on something?",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 20,
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
                "For that, you are at the right place!",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                maxLines: null,
                decoration: InputDecoration(
                  labelText: 'Describe what you want to do',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                maxLines: null,
                decoration: InputDecoration(
                  labelText: 'Email to contact you on!',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                "Choose required skills for it!",
                style: GoogleFonts.poppins(color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 8,
                children: [
                  buildSkillOption('Android Development'),
                  buildSkillOption('iOS Development'),
                  buildSkillOption('Web Development'),
                  buildSkillOption('Cleaning'),
                  buildSkillOption('Electrician'),
                  buildSkillOption('Full-Stack Coding'),
                  buildSkillOption('Public Speaking'),
                  buildSkillOption('Data Entry'),
                  buildSkillOption('Studies'),
                  buildSkillOption('M.U.N Delegate (Experience)'),

                  // Add more skill options here
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Make a proposal!'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSkillOption(String skill) {
    bool isSelected = selectedSkills.contains(skill);
    return GestureDetector(
      onTap: () => selectSkill(skill),
      child: Chip(
        label: Text(skill),
        backgroundColor: isSelected ? Colors.blue : Colors.grey,
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
