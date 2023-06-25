import 'package:flutter/material.dart';
import 'package:skillconnect/common/constants.dart';
import 'package:skillconnect/features/auth/models/user.dart';

import '../../controllers/auth_controller.dart';

class SkillSelectionScreen extends StatefulWidget {
  final UserModel model;

  const SkillSelectionScreen({super.key, required this.model});

  @override
  _SkillSelectionScreenState createState() => _SkillSelectionScreenState();
}

class _SkillSelectionScreenState extends State<SkillSelectionScreen> {
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

  void signUp() {
    AuthController controller = AuthController();
    UserModel newUserModel = UserModel(
        uid: uid,
        name: widget.model.name,
        email: widget.model.email,
        details: widget.model.details,
        password: widget.model.password,
        skills: selectedSkills,
        profilePictureUrl: '');

    controller.register(context, newUserModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skill Selection'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose Skills:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
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
            const SizedBox(height: 16),
            const Text(
              'Selected Skills:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.all(8),
              child: Text(
                selectedSkills.isEmpty
                    ? 'No skills selected'
                    : selectedSkills.join(", "),
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(28),
              ),
              child: TextButton(
                onPressed: () {
                  // Handle sign-up button press
                  signUp();
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
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
        label: Text(
          skill,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: isSelected ? Colors.blue : Colors.grey,
      ),
    );
  }
}
