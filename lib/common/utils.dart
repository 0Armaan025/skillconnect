import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
