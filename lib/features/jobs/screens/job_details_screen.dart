import 'package:flutter/material.dart';

import 'job_opportunities_screen.dart';

class JobDetailsScreen extends StatelessWidget {
  final Job job;

  JobDetailsScreen({required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(job.position),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              job.companyName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            SizedBox(height: 12.0),
            Text(
              'Position: ${job.position}',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 12.0),
            Text(
              'Location: ${job.location}',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Job Description:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              job.description,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Qualifications:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(job.qualifications.length, (index) {
                final qualification = job.qualifications[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 18.0,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        qualification,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
            SizedBox(height: 16.0),
            Text(
              'Responsibilities:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(job.responsiblities.length, (index) {
                final responsibility = job.responsiblities[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_right,
                        size: 18.0,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        responsibility,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
