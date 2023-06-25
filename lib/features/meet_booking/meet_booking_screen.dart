import 'package:flutter/material.dart';
import 'package:skillconnect/common/utils.dart';
import 'package:skillconnect/features/loading_screen/screens/loading_screen.dart';

class MeetBookingScreen extends StatefulWidget {
  @override
  State<MeetBookingScreen> createState() => _MeetBookingScreenState();
}

class _MeetBookingScreenState extends State<MeetBookingScreen> {
  String selectedTimeSlot = '';
  String selectedDay = '';

  final List<String> timeSlots = [
    '9:00 AM',
    '9:15 AM',
    '9:30 AM',
    '9:45 AM',
    '10:00 AM',
    '10:15 AM',
    '10:30 AM',
    '10:45 AM',
    '11:00 AM',
    '11:15 AM',
    '11:30 AM',
    '11:45 AM',
    '12:00 PM',
    '12:15 PM',
    '12:30 PM',
    '12:45 PM',
  ];

  final List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: makeAppBar(context, title: 'Time Slot Selection!!'),
      ),
      drawer: buildDrawer(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select a day:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: List<Widget>.generate(days.length, (index) {
                  return FilterChip(
                    label: Text(days[index]),
                    onSelected: (selected) {
                      setState(() {
                        selectedDay = selected ? days[index] : '';
                      });
                    },
                    selected: selectedDay == days[index],
                    selectedColor: Colors.blue, // Customize the selected color
                    checkmarkColor:
                        Colors.white, // Customize the checkmark color
                  );
                }),
              ),
              const SizedBox(height: 24),
              Text(
                'Selected day: $selectedDay',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Select a time slot:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: List<Widget>.generate(timeSlots.length, (index) {
                  return FilterChip(
                    label: Text(timeSlots[index]),
                    onSelected: (selected) {
                      setState(() {
                        selectedTimeSlot = selected ? timeSlots[index] : '';
                      });
                    },
                    selected: selectedTimeSlot == timeSlots[index],
                    selectedColor: Colors.blue, // Customize the selected color
                    checkmarkColor:
                        Colors.white, // Customize the checkmark color
                  );
                }),
              ),
              const SizedBox(height: 24),
              Text(
                'Selected time slot: $selectedTimeSlot',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  moveScreen(
                      context,
                      const LoadingScreen(
                          networkLink:
                              'https://assets9.lottiefiles.com/packages/lf20_rDputF5tPy.json',
                          text: 'Looking into their schedule!'));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 16.0,
                  ),
                  child: Text(
                    'Book Meeting',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
