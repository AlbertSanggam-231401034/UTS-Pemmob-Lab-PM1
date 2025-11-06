import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMBTIScreen extends StatelessWidget {
  const AboutMBTIScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About MBTI',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Myers-Briggs Type Indicator (MBTI)',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'MBTI adalah alat assessment kepribadian yang mengkategorikan orang menjadi 16 tipe kepribadian berbeda.',
              style: GoogleFonts.inter(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}