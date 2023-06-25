import 'package:flutter/material.dart';

class Course {
  final String title;
  final String instructor;
  final String duration;
  final String imageUrl;

  Course({
    required this.title,
    required this.instructor,
    required this.duration,
    required this.imageUrl,
  });
}

class CoursesScreen extends StatefulWidget {
  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  List<Course> courses = [
    Course(
      title: "Flutter App Development",
      instructor: "John Doe",
      duration: "4 weeks",
      imageUrl:
          "https://cdn.pixabay.com/photo/2012/03/01/00/55/flowers-19830_1280.jpg",
    ),
    Course(
      title: "Web Development with React",
      instructor: "Jane Smith",
      duration: "6 weeks",
      imageUrl:
          "https://cdn.pixabay.com/photo/2012/03/01/00/55/flowers-19830_1280.jpg",
    ),
    // Add more courses here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Courses"),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: InkWell(
                onTap: () {
                  // Handle course selection
                },
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        bottomLeft: Radius.circular(16.0),
                      ),
                      child: Image.network(
                        course.imageUrl,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber),
                              SizedBox(width: 8.0),
                              Text(
                                course.title,
                                style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            "Instructor: ${course.instructor}",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            "Duration: ${course.duration}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        // Handle enrollment
                      },
                      child: Text("Enroll"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
