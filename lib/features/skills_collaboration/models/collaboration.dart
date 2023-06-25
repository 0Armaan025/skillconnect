// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CollaborationModel {
  final String details;
  final String email;
  final String name;
  final String profileUrl;
  final String personDetails;
  final List<String> skills;
  CollaborationModel({
    required this.details,
    required this.email,
    required this.name,
    required this.profileUrl,
    required this.personDetails,
    required this.skills,
  });

  CollaborationModel copyWith({
    String? details,
    String? email,
    String? name,
    String? profileUrl,
    String? personDetails,
    List<String>? skills,
  }) {
    return CollaborationModel(
      details: details ?? this.details,
      email: email ?? this.email,
      name: name ?? this.name,
      profileUrl: profileUrl ?? this.profileUrl,
      personDetails: personDetails ?? this.personDetails,
      skills: skills ?? this.skills,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'details': details,
      'email': email,
      'name': name,
      'profileUrl': profileUrl,
      'personDetails': personDetails,
      'skills': skills,
    };
  }

  factory CollaborationModel.fromMap(Map<String, dynamic> map) {
    return CollaborationModel(
      details: map['details'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
      profileUrl: map['profileUrl'] as String,
      personDetails: map['personDetails'] as String,
      skills: List<String>.from((map['skills'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory CollaborationModel.fromJson(String source) =>
      CollaborationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CollaborationModel(details: $details, email: $email, name: $name, profileUrl: $profileUrl, personDetails: $personDetails, skills: $skills)';
  }

  @override
  bool operator ==(covariant CollaborationModel other) {
    if (identical(this, other)) return true;

    return other.details == details &&
        other.email == email &&
        other.name == name &&
        other.profileUrl == profileUrl &&
        other.personDetails == personDetails &&
        listEquals(other.skills, skills);
  }

  @override
  int get hashCode {
    return details.hashCode ^
        email.hashCode ^
        name.hashCode ^
        profileUrl.hashCode ^
        personDetails.hashCode ^
        skills.hashCode;
  }
}
