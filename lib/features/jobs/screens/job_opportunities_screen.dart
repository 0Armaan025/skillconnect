import 'package:flutter/material.dart';
import 'package:skillconnect/features/jobs/screens/job_details_screen.dart';

class JobOpportunitiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Opportunities'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          height: 1.0,
          color: Colors.grey[300],
        ),
        itemCount: jobList.length,
        itemBuilder: (context, index) {
          final job = jobList[index];
          return InkWell(
            onTap: () {
              // Handle job item tap
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JobDetailsScreen(job: job),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 24.0,
                    backgroundImage: AssetImage(job.companyLogo),
                  ),
                  SizedBox(width: 12.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          job.position,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          job.companyName,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Chip(
                    backgroundColor: Colors.blue,
                    label: Text(
                      job.location,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Job {
  final String companyLogo;
  final String companyName;
  final String position;
  final String location;
  final String description;
  final List<String> qualifications;
  final List<String> responsiblities;
  Job({
    required this.companyLogo,
    required this.companyName,
    required this.position,
    required this.location,
    required this.description,
    required this.qualifications,
    required this.responsiblities,
  });
}

// Dummy job data
final List<Job> jobList = [
  Job(
    companyLogo: 'assets/images/avatar.png',
    companyName: 'Company 1',
    qualifications: ["madfa", "b"],
    position: 'Job Position 1',
    location: 'Location 1',
    description: 'Job Description 1',
    responsiblities: ["b", "m"],
  ),
  Job(
    companyLogo: 'assets/images/avatar.png',
    companyName: 'Company 1',
    qualifications: ["m", "b"],
    position: 'Job Position 1',
    location: 'Location 1',
    description: 'Job Description 1',
    responsiblities: ["b", "m"],
  ),
  Job(
    companyLogo: 'assets/images/avatar.png',
    companyName: 'Company 1',
    qualifications: ["m", "b"],
    position: 'Job Position 1',
    location: 'Location 1',
    description: 'Job Description 1',
    responsiblities: ["b", "m"],
  ),
  // Add more job entries as needed
];
