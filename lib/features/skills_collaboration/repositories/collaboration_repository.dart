import 'package:flutter/material.dart';
import 'package:skillconnect/common/constants.dart';
import 'package:skillconnect/common/utils.dart';
import 'package:skillconnect/features/home_screen/screens/home_screen.dart';
import 'package:skillconnect/features/skills_collaboration/models/collaboration.dart';

class CollaborationRepository {
  //upload the proposal

  void uploadProposal(BuildContext context, CollaborationModel model) {
    //upload it
    firestore
        .collection('collaborationProposals')
        .doc('${model.name}+${DateTime.now().toString()}')
        .set(model.toMap())
        .then((value) {
      moveScreen(context, HomeScreen());
    });
  }
}
