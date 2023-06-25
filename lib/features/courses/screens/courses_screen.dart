import 'package:flutter/material.dart';
import 'package:skillconnect/common/utils.dart';
import 'package:skillconnect/features/courses/screens/add_course_screen.dart';
import 'package:skillconnect/features/courses/screens/enroll_screen.dart';

import '../../../common/constants.dart';

class CourseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
      ),
      floatingActionButton: FloatingActionButton(
        child: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            moveScreen(
                context,
                AddCourseScreen(
                  courses: courses,
                ));
          },
        ),
        onPressed: () {},
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (BuildContext context, int index) {
          return CourseCard(
            course: courses[index],
            onPressed: () {
              moveScreen(context, EnrollScreen(course: courses[index]));
            },
          );
        },
      ),
    );
  }
}

class Course {
  final String title;
  final String description;

  const Course({
    required this.title,
    required this.description,
  });
}

class CourseCard extends StatelessWidget {
  final Course course;
  final VoidCallback onPressed;

  const CourseCard({
    required this.course,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              course.title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(course.description),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: onPressed,
              child: const Text('Enroll'),
            ),
          ],
        ),
      ),
    );
  }
}
