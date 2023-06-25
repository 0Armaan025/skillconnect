import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:skillconnect/common/constants.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(userProfileUrl),
            ),
            SizedBox(height: 16.0),
            Text(
              userName,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            RatingBar.builder(
              initialRating: 4.5,
              itemSize: 24.0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                // Update rating logic here
              },
            ),
            SizedBox(height: 8.0),
            Text(
              'Level: Intermediate',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              email,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Skills:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Wrap(
              spacing: 8.0,
              children: userSkills
                  .map(
                    (userSkills) => Chip(
                      label: Text(userSkills),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 16.0),
            Text(
              'Details:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              userDetails,
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
