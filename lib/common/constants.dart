import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

const String appName = "SkillConnect";
const String appTagline = "Empower, Collaborate, Thrive.";

const Color bgColor = Color(0xFFf3f4fd);

String uid = "";
String userName = "";
String email = "";

String userProfileUrl = "";

File? imageFile;

var firestore = FirebaseFirestore.instance;
var firebaseAuth = FirebaseAuth.instance;
