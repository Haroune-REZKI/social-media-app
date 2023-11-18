import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'package:mobile_dev_project/feature/feed/views/home_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Media Application',
      debugShowCheckedModeBanner: true,
      home: const HomeFeed(),
      theme: ThemeData(fontFamily: GoogleFonts.montserrat().fontFamily),
      routes: const {
        // to be filled
      },
    );
  }
}
