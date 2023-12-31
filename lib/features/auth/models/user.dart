// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String details;
  final String password;
  final List<String> skills;
  final String profilePictureUrl;
  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.details,
    required this.password,
    required this.skills,
    required this.profilePictureUrl,
  });

  UserModel copyWith({
    String? uid,
    String? name,
    String? email,
    String? details,
    String? password,
    List<String>? skills,
    String? profilePictureUrl,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      details: details ?? this.details,
      password: password ?? this.password,
      skills: skills ?? this.skills,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'email': email,
      'details': details,
      'password': password,
      'skills': skills,
      'profilePictureUrl': profilePictureUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      details: map['details'] as String,
      password: map['password'] as String,
      skills: List<String>.from((map['skills'] as List<String>)),
      profilePictureUrl: map['profilePictureUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(uid: $uid, name: $name, email: $email, details: $details, password: $password, skills: $skills, profilePictureUrl: $profilePictureUrl)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.name == name &&
        other.email == email &&
        other.details == details &&
        other.password == password &&
        listEquals(other.skills, skills) &&
        other.profilePictureUrl == profilePictureUrl;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        name.hashCode ^
        email.hashCode ^
        details.hashCode ^
        password.hashCode ^
        skills.hashCode ^
        profilePictureUrl.hashCode;
  }
}
