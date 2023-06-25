import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MentorsListTileWidget extends StatefulWidget {
  const MentorsListTileWidget({super.key});

  @override
  State<MentorsListTileWidget> createState() => _MentorsListTileWidgetState();
}

class _MentorsListTileWidgetState extends State<MentorsListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Card(
        elevation: 3.0,
        child: Container(
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage('https://picsum.photos/120'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Armaan",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "armaan33000@gmail.com",
                      style: GoogleFonts.poppins(
                          color: Colors.grey.shade500, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 50,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blue.shade400,
                ),
                alignment: Alignment.center,
                child: const Center(
                  child: Text(
                    'Get Mentored',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
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
