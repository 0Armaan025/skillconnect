import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import the Firestore package
import 'package:skillconnect/features/mentoring/widgets/mentoring_widget.dart';
import 'package:skillconnect/features/skills_collaboration/screens/add_skill_collaboration.dart';
import 'package:skillconnect/features/skills_collaboration/widgets/skill_collaborative_widget.dart';

import '../../../common/constants.dart';
import '../../../common/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CollectionReference _collaborativeProposalsCollection =
      FirebaseFirestore.instance.collection('collaborationProposals');
  late Stream<QuerySnapshot> _collaborativeProposalsStream;

  @override
  void initState() {
    super.initState();
    _collaborativeProposalsStream =
        _collaborativeProposalsCollection.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: buildDrawer(context),
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: makeAppBar(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Good Evening, Armaan!",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0.0, right: 88),
                    child: Text(
                      "25th June, 2023!",
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 22.0),
                child: Row(
                  children: [
                    Text(
                      "Skills Collaborative Projects...",
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(width: 30),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          moveScreen(context, AddSkillCollaborationScreen());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: StreamBuilder<QuerySnapshot>(
                  stream: _collaborativeProposalsStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(); // Show a loading indicator while waiting for data
                    }

                    final proposals = snapshot.data!.docs;

                    return Row(
                      children: proposals.map((proposal) {
                        final proposalData =
                            proposal.data() as Map<String, dynamic>?;
                        if (proposalData != null) {
                          //
                          final skills =
                              (proposalData['skills'] as List<dynamic>)
                                  .cast<String>();

                          return SkillCollaborativeWidget(
                            personDetails: proposalData['personDetails'],
                            details: proposalData['details'],
                            email: proposalData['email'],
                            name: proposalData['name'],
                            profilePictureUrl: proposalData['profileUrl'],
                            skills: skills,
                          );
                        } else {
                          return SizedBox();
                        }
                      }).toList(),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 22.0),
                child: Row(
                  children: [
                    Text(
                      "Want to be mentored by a mentor?",
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 30),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    MentoringWidget(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Text(
                "Made with 💖 for LingHacks V Hackathon.",
                style: GoogleFonts.poppins(color: Colors.purple),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
