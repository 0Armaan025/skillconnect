import 'package:flutter/material.dart';

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
