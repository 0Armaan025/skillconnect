import 'package:flutter/material.dart';
import 'package:skillconnect/features/mentoring/widgets/mentor_list_tile_widget.dart';

import '../../../common/constants.dart';
import '../../../common/utils.dart';

class MentorsListScreen extends StatefulWidget {
  const MentorsListScreen({super.key});

  @override
  State<MentorsListScreen> createState() => _MentorsListScreenState();
}

class _MentorsListScreenState extends State<MentorsListScreen> {
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
            MentorsListTileWidget(),
          ],
        ),
      ),
    );
  }
}
