import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skillconnect/features/chat/screens/chat_screen.dart';
import 'package:skillconnect/features/courses/screens/courses_screen.dart';
import 'package:skillconnect/features/home_screen/screens/home_screen.dart';
import 'package:skillconnect/features/mentoring/screens/mentors_list_screen.dart';

import 'constants.dart';

Widget makeAppBar(BuildContext context, {String title = "$appName"}) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

//move the screeeeeeen

void moveScreen(BuildContext context, Widget screenName,
    {bool isPushReplacement = false}) {
  if (isPushReplacement) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => screenName));
  } else {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => screenName));
  }
}

//pick Image

void pickImage(BuildContext context) async {
  final ImagePicker _picker = ImagePicker();
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

  if (image != null) {
    imageFile = File(image.path);
  } else {
    showSnackBar(context, "No Image Selected!");
  }
}

//showSnackBar

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
      duration: const Duration(seconds: 1),
    ),
  );
}

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(userProfileUrl),
                radius: 30,
              ),
              const SizedBox(height: 10),
              Text(
                userName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                email,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            moveScreen(context, HomeScreen());
          },
        ),
        ListTile(
          leading: const Icon(Icons.work),
          title: const Text('Job Opportunities'),
          onTap: () {
            // Handle Job Opportunities onTap
          },
        ),
        ListTile(
          leading: const Icon(Icons.people),
          title: const Text('Mentors'),
          onTap: () {
            moveScreen(context, const MentorsListScreen());
          },
        ),
        ListTile(
          leading: const Icon(Icons.chat),
          title: const Text('Chat'),
          onTap: () {
            moveScreen(context, ChatScreen());
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {
            // Handle Settings onTap
          },
        ),
        ListTile(
          leading: const Icon(Icons.school),
          title: const Text('Learn'),
          onTap: () {
            moveScreen(context, CourseScreen());
          },
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('Profile Screen'),
          onTap: () {
            // Handle Profile Screen onTap
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Log Out'),
          onTap: () {
            // Handle Log Out onTap
          },
        ),
      ],
    ),
  );
}
