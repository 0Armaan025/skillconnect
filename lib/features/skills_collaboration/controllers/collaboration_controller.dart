import 'package:flutter/material.dart';
import 'package:skillconnect/features/skills_collaboration/models/collaboration.dart';
import 'package:skillconnect/features/skills_collaboration/repositories/collaboration_repository.dart';

class CollaborationController {
  CollaborationRepository _repository = CollaborationRepository();
  void makeProposal(BuildContext context, CollaborationModel model) {
    _repository.uploadProposal(context, model);
  }
}
