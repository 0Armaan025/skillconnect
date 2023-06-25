import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../features/courses/screens/courses_screen.dart';

const String appName = "SkillConnect";
const String appTagline = "Empower, Collaborate, Thrive.";

const Color bgColor = Color(0xFFf3f4fd);
final List<Course> courses = [
  Course(
    title: 'Flutter Development',
    description: 'Learn how to build mobile apps with Flutter.',
  ),
  Course(
    title: 'Web Development',
    description:
        'Master the art of web development with HTML, CSS, and JavaScript.',
  ),
];

String uid = "";
String userName = "";
String email = "";

String userProfileUrl = "";

File? imageFile;

var firestore = FirebaseFirestore.instance;
var firebaseAuth = FirebaseAuth.instance;
