import 'package:flutter/material.dart';

import '../../../common/constants.dart';
import '../../../common/utils.dart';

class GetMentoredScreen extends StatefulWidget {
  const GetMentoredScreen({super.key});

  @override
  State<GetMentoredScreen> createState() => GetMentoredScreenState();
}

class GetMentoredScreenState extends State<GetMentoredScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: buildDrawer(context),
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: makeAppBar(context),
      ),
      
    );
  }
}
